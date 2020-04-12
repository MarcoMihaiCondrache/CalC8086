; Mouse macros
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Macros to handle the mouse position
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
set_operator macro
    clear_output
    call close_number_1
    mov DIGIT_COUNT, 4
    endm
reset_operation_status macro
    mov LAST_OPERATION_STATUS, 0
    endm
handle_div macro
    local continue
    cmp ax, 40+X_OFFSET
    jl continue
    cmp ax, 48+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 14+Y_OFFSET
    jg continue
    cmp DIGIT_COUNT, 4
    je continue
    mov OPERATOR, 4
    set_operator
    continue:
    endm
handle_mul macro
    local continue
    cmp ax, 30+X_OFFSET
    jl continue
    cmp ax, 38+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 14+Y_OFFSET
    jg continue
    cmp DIGIT_COUNT, 4
    je continue
    mov OPERATOR, 3
    set_operator
    continue:
    endm
handle_minus macro
    local continue
    cmp ax, 30+X_OFFSET
    jl continue
    cmp ax, 38+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    cmp DIGIT_COUNT, 4
    je continue
    mov OPERATOR, 2
    set_operator
    continue:
    endm

handle_plus macro
    local continue
    cmp ax, 40+X_OFFSET
    jl continue
    cmp ax, 48+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    cmp DIGIT_COUNT, 4
    je continue
    mov OPERATOR, 1
    set_operator
    continue:
    endm

handle_equal macro
    local continue
    cmp ax, 30+X_OFFSET
    jl continue
    cmp ax, 58+X_OFFSET
    jg continue
    cmp dx, 15+Y_OFFSET
    jl continue
    cmp dx, 19+Y_OFFSET
    jg continue
    call solve
    continue:
    endm

handle_off macro
    local continue
    cmp ax, 50+X_OFFSET
    jl continue
    cmp ax, 58+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 14+Y_OFFSET
    jg continue
    reset_mouse
    hide_mouse
    clear
    so_return
    continue:
    endm

handle_ac macro
    local continue
    cmp ax, 50+X_OFFSET
    jl continue
    cmp ax, 58+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    call clear_all
    continue:
    endm

handle_number_7 macro
    local continue, addton1, addton2
    cmp ax, 0+X_OFFSET
    jl continue
    cmp ax, 8+X_OFFSET
    jg continue
    cmp dx, 0+Y_OFFSET
    jl continue
    cmp dx, 4+Y_OFFSET
    jg continue
    add_to_number 7
    continue:
    endm

handle_number_8 macro
    local continue, addton1, addton2
    cmp ax, 10+X_OFFSET
    jl continue
    cmp ax, 18+X_OFFSET
    jg continue
    cmp dx, 0+Y_OFFSET
    jl continue
    cmp dx, 4+Y_OFFSET
    jg continue
    add_to_number 8
    continue:
    endm

handle_number_9 macro
    local continue, addton1, addton2
    cmp ax, 20+X_OFFSET
    jl continue
    cmp ax, 28+X_OFFSET
    jg continue
    cmp dx, 0+Y_OFFSET
    jl continue
    cmp dx, 4+Y_OFFSET
    jg continue
    add_to_number 9
    continue:
    endm

handle_number_4 macro
    local continue, addton1, addton2
    cmp ax, 0+X_OFFSET
    jl continue
    cmp ax, 8+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    add_to_number 4
    continue:
    endm

handle_number_5 macro
    local continue, addton1, addton2
    cmp ax, 10+X_OFFSET
    jl continue
    cmp ax, 18+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    add_to_number 5
    continue:
    endm

handle_number_6 macro
    local continue, addton1, addton2
    cmp ax, 20+X_OFFSET
    jl continue
    cmp ax, 28+X_OFFSET
    jg continue
    cmp dx, 5+Y_OFFSET
    jl continue
    cmp dx, 9+Y_OFFSET
    jg continue
    add_to_number 6
    continue:
    endm

handle_number_1 macro
    local continue, addton1, addton2
    cmp ax, 0+X_OFFSET
    jl continue
    cmp ax, 8+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 15+Y_OFFSET
    jg continue
    add_to_number 1
    continue:
    endm

handle_number_2 macro
    local continue, addton1, addton2
    cmp ax, 10+X_OFFSET
    jl continue
    cmp ax, 18+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 15+Y_OFFSET
    jg continue
    add_to_number 2
    continue:
    endm

handle_number_3 macro
    local continue, addton1, addton2
    cmp ax, 20+X_OFFSET
    jl continue
    cmp ax, 28+X_OFFSET
    jg continue
    cmp dx, 10+Y_OFFSET
    jl continue
    cmp dx, 15+Y_OFFSET
    jg continue
    add_to_number 3
    continue:
    endm

handle_number_0 macro
    local continue
    cmp ax, 0+X_OFFSET
    jl continue
    cmp ax, 28+X_OFFSET
    jg continue
    cmp dx, 15+Y_OFFSET
    jl continue
    cmp dx, 19+Y_OFFSET
    jg continue
    add_to_number 0
    continue:
    endm

add_to_number macro num
    local next, ends, skip_print, continue
    cmp LAST_OPERATION_STATUS, 1
    jne continue
    call clear_all
    continue:
    cmp DIGIT_COUNT, 0
    je skip_print
    mov bx, num
    add bl, 48
    print_char bl
    sub bl, 48
    skip_print:
    cmp NUM1_USED, 1
    je next
    call add_to_number_1
    jmp ends
    next:
    mov bx, num
    cmp NUM2_USED, 1
    je ends
    call add_to_number_2
    ends:
    endm