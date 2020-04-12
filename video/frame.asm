; Frame MACRO
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Draw a Frame on the screen from the position given with the char and sizes provided.
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
draw_frame_char macro xs, ys, wi, he, h, v, ctl, ctr, cbl, cbr
    local u1
    local u2
    local u3
    local u4
    ; draw upper line:
    mov counter, xs+wi
u1:
    move_xy counter, ys
    print_char h
    dec counter
    cmp counter, xs
    jg u1
    ; draw bottom line
    mov counter, xs+wi
u2:
    move_xy counter, ys+he
    print_char h
    dec counter
    cmp counter, xs
    jg u2
    ; draw left line
    mov counter, ys+he
u3:
    move_xy xs, counter
    print_char v
    dec counter
    cmp counter, ys
    jg u3
    ; draw right line
    mov counter, ys+he
u4:
    move_xy xs+wi, counter
    print_char v
    dec counter
    cmp counter, ys
    jg u4

    ; print corners

    move_xy xs, ys
    print_char ctl
    move_xy xs, ys+he
    print_char cbl
    move_xy xs+wi, ys
    print_char ctr
    move_xy xs+wi, ys+he
    print_char cbr

    endm