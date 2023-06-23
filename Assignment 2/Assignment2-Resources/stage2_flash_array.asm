 ; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        push{r0,r1,r2,r4,r5,r6,r7,r8}
        mov r4,r0
        mov r5,#0
        mov r7,#4
        mul r8,r1,r7

        loop$:
                ldr r6,[r2,r5]

                push{r0,r1,r2,lr}
                mov r0,r4
                mov r1,r6
                mov r2,$80000
                bl FLASH
                pop{r0,r1,r2,lr}

                push{r0,r1}
                mov r1,$0F0000
                mov r0,r4
                push{lr}
                bl PAUSE
                pop{lr}
                pop{r0,r1}

                add r5,r7
                cmp r5,r8
                bne loop$
        pop{r0,r1,r2,r4,r5,r6,r7,r8}
        bx lr