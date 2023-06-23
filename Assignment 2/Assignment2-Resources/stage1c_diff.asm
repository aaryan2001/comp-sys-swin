; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
       push{r6,r7,r8,r9,r10,r11}
        mov r6,r0
        mov r7,r1
        mov r8,r2
        mov r9,#0
        mov r10,#0
        mov r11,#0

        push{lr}
        bl stage1a_min
        pop{lr}
        mov r9,r0
        mov r0,r6
        mov r1,r7
        mov r2,r8
        push{lr}
        bl stage1b_max
        pop{lr}
        mov r10,r0
        sub r11,r10,r9
        mov r0,r11


        pop{r6,r7,r8,r9,r10,r11}
        bx lr