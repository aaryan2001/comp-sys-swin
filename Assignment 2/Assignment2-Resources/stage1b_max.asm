; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        push{r1,r2,r3}
        mov r3,#0
        cmp r0,r1
        bge VAL_ONEB
        cmp r1,r2
        bge VAL_TWOB
        b THREEB




        VAL_ONEB:
                cmp r0,r2
                bge ONEB
                blt THREEB
        ONEB:
                mov r3,r0
                b QUITB


        VAL_TWOB:
                cmp r1,r0
                bge TWOB
                blt ONEB
        TWOB:
                mov r3,r1
                b QUITB


        THREEB:
                mov r3,r2
                b QUITB

        QUITB:
                mov r0,r3
                pop{r1,r2,r3}
                bx lr
