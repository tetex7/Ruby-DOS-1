MEMCPY_REQ_CODE equ 15
SET_MEM_BANK_REQ_CODE equ 5

reqsys:
    push de
    push hl

    cmp a, MEMCPY_REQ_CODE        ; if b == MEMCPY_REQ_CODE then
    calleq memcpy_task            ;    memcpy_task()
    cmp a, SET_MEM_BANK_REQ_CODE  ; eles if b == SET_MEM_BANK_REQ_COD then
    calleq set_mem_bank_task      ;    set_mem_bank_task()
                                  ; endif

    cmp a, 1
    jeq reset_req_on_ret
    jneq reqsys_end

reset_req_on_ret
    pop hl
    pop de

reqsys_end:
    ret

req_arg_a:
    dw 0

req_arg_b:
    dw 0

req_arg_c:
    dw 0

memcpy_task:
    pop hl
    pop de
    lddr

    ld a, 0

    push de
    pop bc
    ret

set_mem_bank_task:
    nop ; TODO
    ret
