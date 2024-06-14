    cmp  MACRO opt1, opt2
        ;ld ($+4), a
        ld a, opt1
        ;jr $+2
        ;db 0
        cp opt2
        ;jr $+4
    ENDM

    jeq macro adder
        jp z, adder
    endm

    block macro n, val
        rept n
            db val
        endm
    endm

    macro reqcall
        call reqsys
    endm

    jneq macro adder
        jp nz, adder
    endm

    calleq  macro adder
        call z, adder
    endm

    callneq macro adder
        call nz, adder
    endm

    retneq macro
        ret nz
    endm

    reteq macro
        ret z
    endm

    word macro ...
        dw ...
    endm

    defval macro dname, dval
            dname macro
                dval
            endm
    endm

    stackld macro to, from
        push from
        pop to
    endm