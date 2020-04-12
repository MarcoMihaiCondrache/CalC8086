; Obj File
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Macros to draw the objects on the screen
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
draw_numbers macro
    ;7
    move_xy 4+X_OFFSET, 2+Y_OFFSET
    print_char 55
    draw_frame_char 0+X_OFFSET,0+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;8
    move_xy 14+X_OFFSET, 2+Y_OFFSET
    print_char 56
    draw_frame_char 10+X_OFFSET,0+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;9
    move_xy 24+X_OFFSET, 2+Y_OFFSET
    print_char 57
    draw_frame_char 20+X_OFFSET,0+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;4
    move_xy 4+X_OFFSET, 7+Y_OFFSET
    print_char 52
    draw_frame_char 0+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;5
    move_xy 14+X_OFFSET, 7+Y_OFFSET
    print_char 53
    draw_frame_char 10+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;6
    move_xy 24+X_OFFSET, 7+Y_OFFSET
    print_char 54
    draw_frame_char 20+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;1
    move_xy 4+X_OFFSET, 12+Y_OFFSET
    print_char 49
    draw_frame_char 0+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;2
    move_xy 14+X_OFFSET, 12+Y_OFFSET
    print_char 50
    draw_frame_char 10+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;3
    move_xy 24+X_OFFSET, 12+Y_OFFSET
    print_char 51
    draw_frame_char 20+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;0
    move_xy 24+X_OFFSET, 17+Y_OFFSET
    print_char 48
    draw_frame_char 0+X_OFFSET,15+Y_OFFSET,28,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR
    endm

draw_signs macro
    ;plus panel
    move_xy 44+X_OFFSET, 7+Y_OFFSET
    print_char PLUS
    draw_frame_char 40+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;minus panel
    move_xy 34+X_OFFSET, 7+Y_OFFSET
    print_char MINUS
    draw_frame_char 30+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;multiplication panel
    move_xy 34+X_OFFSET, 12+Y_OFFSET
    print_char MULTIPLICATION
    draw_frame_char 30+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;division panel
    move_xy 44+X_OFFSET, 12+Y_OFFSET
    print_char DIVISION
    draw_frame_char 40+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR
    endm

draw_operational macro
    ;output panel
    move_xy 24+X_OFFSET, 2+Y_OFFSET
    print_char 57
    draw_frame_char 30+X_OFFSET,0+Y_OFFSET,28,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ;ac panel
    move_xy 54+X_OFFSET, 7+Y_OFFSET
    print_string DELETE_ALL
    draw_frame_char 50+X_OFFSET,5+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    move_xy 53+X_OFFSET, 12+Y_OFFSET
    print_string OFF
    draw_frame_char 50+X_OFFSET,10+Y_OFFSET,8,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR

    ; equal button
    move_xy 54+X_OFFSET, 17+Y_OFFSET
    print_char 61
    draw_frame_char 30+X_OFFSET,15+Y_OFFSET,28,4,DRAW_CHAR_X,DRAW_CHAR_Y,DRAW_CHAR_TL,DRAW_CHAR_TR,DRAW_CHAR_BL,DRAW_CHAR_BR
    endm

draw_infos macro
    move_xy 0+X_OFFSET, 24
    print_string COPYRIGHT
    endm

clear_output macro
    draw_rect_char 31+X_OFFSET, 1+Y_OFFSET, 26, 2, 32
    move_xy 34+X_OFFSET, 2+Y_OFFSET
    endm

reset_cursor_position macro
    move_xy 34+X_OFFSET, 2+Y_OFFSET
    endm