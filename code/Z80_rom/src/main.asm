MAIN_CPU_POWER_REG equ 0xFC
MORE_WORK_READY_FLAG equ 0xCC
POWER_OFF_FLAG equ 0xC1
TODO_MAIN_MEM_START_ADDER equ 0xCC

    org 0x00
boot_vec:
    db 0
;rom_metadata:
;    db "tete", 0
;    db 4
;    db "z80 ctl ROM and mem-man", 0
;    db 23


    org 0x200
work_buff:
    block (256/2), 0x00
    ret

z80_start_ram equ work_buff

__start:
    ld bc, TODO_MAIN_MEM_START_ADDER
    call mem_setup
    cmp b, 1

    jeq cpu_start_up
    jneq run_loop

    ld a, 45
    ld bc, 0x455

cpu_start_up:
    ld hl, MAIN_CPU_POWER_REG
    ld (hl), b

run_loop:
    cmp (MORE_WORK_READY_FLAG), 1; *(MORE_WORK_READY_FLAG) == true

    calleq work_buff

    jr run_loop
start_error:
    halt
    jr start_error

mem_setup: ;todo
    ret