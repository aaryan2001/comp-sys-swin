; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        push{r1,r2,r3}
        mov r3,#0
        cmp r0,r1
        ble VAL_ONEA
        cmp r1,r2
        ble VAL_TWOA
        b THREEA




        VAL_ONEA:
                cmp r0,r2
                ble ONEA
                bgt THREEA
        ONEA:
                mov r3,r0
                b QUITA


        VAL_TWOA:
                cmp r1,r0
                ble TWOA
                bgt ONEA
        TWOA:
                mov r3,r1
                b QUITA


        THREEA:
                mov r3,r2
                b QUITA

        QUITA:
                mov r0,r3
                pop{r1,r2,r3}
                bx lr
