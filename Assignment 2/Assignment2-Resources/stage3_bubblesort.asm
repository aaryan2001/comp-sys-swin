; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        push{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}
        mov r7,r0
        mov r8,r1
        mov r9,r2
        mov r4,#0
        mov r5,#0
        mov r6,#4
        mul r10,r7,r6

        outerloop:
                mov r4,#0
                mov r6,#4
                innerloop1:
                        ldr r11,[r8,r4]
                        innerloop2:
                        ldr r12,[r8,r6]
                        cmp r11,r12
                        bhi sort
                        add r4,#4
                        add r6,#4
                        cmp r10,r4
                        bne innerloop1
                add r5,#1
                cmp r5,r7
                bne outerloop
                mov r0,r9
                mov r1,r7
                mov r2,r8
                bl stage2_flash_array
                pop{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}
                bx lr

           sort:
           str r11,[r8,r6]
           str r12,[r8,r4]