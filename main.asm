; Main File
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Main file to start the program
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
include utils/macro.asm
include video/box.asm
include video/frame.asm
include video/obj.asm
include fun/mouse.asm

.model tiny

.data
include utils/const.asm
counter DB 0
counter2 DB 0

.code
org 0100h

main:
    setvideo_mode 03h
    hide_cursor
    reset_mouse
    clear

    draw_numbers
    draw_signs
    draw_operational

    draw_infos

    show_mouse
    reset_cursor_position
    handle:
        status_mouse
        cmp bx, 1
        jne handle
        next:
        mov ax, cx
        mov cl, 3
        shr ax, cl
        shr dx, cl

        handle_off

        handle_number_7
        handle_number_8
        handle_number_9
        handle_number_4
        handle_number_5
        handle_number_6
        handle_number_1
        handle_number_2
        handle_number_3
        handle_number_0

        handle_ac

        handle_plus
        handle_minus
        handle_mul
        handle_div

        handle_equal

        clear_reg
        jmp handle

    close_number_1 proc
        cmp NUM1_USED, 1
        je exit_close_1
        xor dx, dx
        mov ax, NUM1
        div TEN
        mov NUM1, ax
        mov NUM1_USED, 1
        exit_close_1:
        ret
    endp

    close_number_2 proc
        cmp NUM2_USED, 1
        je exit_close_2
        xor dx, dx
        mov ax, NUM2
        div TEN
        mov NUM2, ax
        mov NUM2_USED, 1
        exit_close_2:
        ret
    endp

    solve proc
        call close_number_2
        cmp NUM1_USED, 1
        jne exit_solve
        cmp NUM2_USED, 1
        jne exit_solve
        cmp OPERATOR, 1
        je addition
        cmp OPERATOR, 2
        je subtraction
        cmp OPERATOR, 3
        je multiplication_l
        cmp OPERATOR, 4
        je division_l
        addition:
        call add_numbers
        jmp exit_solve
        subtraction:
        call sub_numbers
        jmp exit_solve
        multiplication_l:
        call mul_numbers
        jmp exit_solve
        division_l:
        call div_numbers
        jmp exit_solve
        exit_solve:
        ret
    endp

    add_numbers proc
        mov ax, NUM1
        add ax, NUM2
        mov ANS, ax
        call clear_all
        mov ax, ANS        
        mov LAST_OPERATION_STATUS, 1
        call print_number
        ret
    endp

    sub_numbers proc
        mov bx, NUM1
        cmp bx, NUM2
        jge pos
        cmp bx, NUM2
        jl negt
        pos:
        mov ax, NUM1
        sub ax, NUM2
        mov ANS, ax
        call clear_all
        jmp answer
        negt:
        mov ax, NUM2
        sub ax, NUM1
        mov ANS, ax
        call clear_all
        move_xy 33+X_OFFSET, 2+Y_OFFSET
        print_char MINUS

        answer:
        mov LAST_OPERATION_STATUS, 1
        mov ax, ANS
        call print_number
        ret
    endp

    mul_numbers proc
        mov ax, NUM1
        mul NUM2
        mov ANS, dx
        jo mul_overflow
        push ax
        call clear_all
        mov ax, ANS
        cmp ax, 0
        je notprintzero
        call print_number
        notprintzero:
        pop ax
        call print_number
        mov LAST_OPERATION_STATUS, 1
        jmp mul_exit
        mul_overflow:
        reset_cursor_position
        print_string OVERFLOW
        mul_exit:
        ret
    endp

    div_numbers proc
        cmp NUM2, 0
        je exit_num_is_0
        mov ax, NUM1
        div NUM2
        mov ANS, ax
        mov REMAINDER, dx
        call clear_all
        mov ax, ANS
        call print_number
        cmp REMAINDER, 0
        je close_division
        move_xy 51+X_OFFSET, 2+Y_OFFSET
        print_string DIVISION_REMAINDER
        mov ax, REMAINDER
        call print_number
        close_division:
        jmp exit_division
        exit_num_is_0:
        clear_output
        print_string DIVISION_ZERO
        jmp return_division
        exit_division:
        mov LAST_OPERATION_STATUS, 1
        return_division:
        ret
    endp
    
    add_to_number_1 proc
        cmp DIGIT_COUNT, 0
        je gdgg
        mov ax, bx
        add NUM1, ax
        cmp DIGIT_COUNT, 1
        je printg
        mov al, 10
        mul NUM1
        mov NUM1, ax
        clear_reg
        printg:
        dec DIGIT_COUNT
        cmp DIGIT_COUNT, 0
        jne gdgg
        mov NUM1_USED, 1
        gdgg:
        ret
    endp

    add_to_number_2 proc
        cmp DIGIT_COUNT, 0
        je gdgj
        mov ax, bx
        add NUM2, ax
        cmp DIGIT_COUNT, 1
        je printj
        mov al, 10
        mul NUM2
        mov NUM2, ax
        clear_reg
        printj:
        dec DIGIT_COUNT
        cmp DIGIT_COUNT, 0
        jne gdgj
        mov NUM2_USED, 1
        gdgj:
        ret
    endp

    clear_all proc
        mov OPERATOR, 0
        mov NUM1, 0
        mov NUM1_USED, 0
        mov NUM2, 0
        mov NUM2_USED, 0
        mov DIGIT_COUNT, 4
        reset_operation_status
        clear_output
        clear_reg
        ret
    endp

    print_number proc
        mov cx,0 
        mov dx,0 
        label1:
        cmp ax,0 
        je print1
        mov bx,10
        div bx
        push dx
        inc cx
        xor dx,dx 
        jmp label1 
        print1:
        cmp cx,0
        je exit
        pop dx
        add dx,48
        mov ah,02h 
        int 21h 
        dec cx 
        jmp print1 
        exit:
        cmp ax, 0
        je print_zero
        jmp exit_2
        print_zero:
        print_char 48
        exit_2:
        ret
    endp
    
end main