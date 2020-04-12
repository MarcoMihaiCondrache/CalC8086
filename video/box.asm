; Rect MACRO
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Draw a full rectangle on the screen from the position given with the char and sizes provided.
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
draw_rect_char macro xs, ys, wi, he, c
    local floop
    local sloop
    mov counter, ys+he
    floop:
    mov counter2, xs+wi
    sloop:
    move_xy counter2, counter
    print_char c
    dec counter2
    cmp counter2, xs
    jge sloop
    dec counter
    cmp counter, ys
    jge floop
    endm