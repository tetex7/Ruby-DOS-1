    include "src/helper_mac.inc"
    include "zsys_ctl.pram.bin.sym"
RAM_IMG_LEN equ (end_ram_img-ram_img)

cpu_bank	EQU 00CA0H
end_cpu_bank	EQU 00D20H

    org 0x0
__boot:
    ld bc, RAM_IMG_LEN
    ld de, z80_start_ram
    ld hl, ram_img
    lddr

    ld a,  0
    ld bc, 0
    ld de, 0
    ld hl, 0
    jp __start

E1: 
    halt
    jr E1
    db "R"
ram_img:
    incbin "zsys_ctl.fixed.bin"
end_ram_img:


    if $ >= 0x200
        .error "ram_img to big"
    endif
