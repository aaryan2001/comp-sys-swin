;Calculate
mov r1,#4 ;input
mov sp,$1000  ;make room on the stack
mov r0,r1  
bl FACTORIAL
mov r7,r0 ;store answer
BASE = $3F000000 ;RP2 and RP3 ;GPIO_SETUP
GPIO_OFFSET = $200000
mov r0,BASE
orr r0,GPIO_OFFSET
mov r1,#1
lsl r1,#24
str r1,[r0,#4]     ;set GPIO18 to output
loop$:
  mov r1,#1
  lsl r1,#18
  str r1,[r0,#28]  ;turn LED on
  mov r2,$0F0000  ;not using r2 for anything else so no need to push/pop
  bl TIMER
  mov r1,#1
  lsl r1,#18
  str r1,[r0,#40]  ;turn LED off
  mov r2,$0F0000
  bl TIMER
sub r7,#1
cmp r7,#0
bne  loop$  ;end of outer loop. Runs r7 times
wait:
b wait
include "TIMER.asm"
include "factorialj.asm"
