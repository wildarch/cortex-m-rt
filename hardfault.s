  .global HardFault
  .thumb_func
HardFault:
  movs r0, #4
  mov  r1, lr
  tst  r0, r1      // Test bit[3] of EXC_RETURN to determine thread mode

  beq HardFault.MSP

HardFault.PSP:
  mrs r0, PSP      // Use Process Stack Pointer (if in user mode)
  bl UserHardFault // Jump to hard fault handler

HardFault.MSP:
  mrs r0, MSP      // Use Main Stack Pointer (if in privileged mode)
  bl UserHardFault // Jump to hard fault handler
