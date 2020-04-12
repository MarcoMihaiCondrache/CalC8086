; System macros/consts
; Author: Marco Mihai Condrache
; Date: 12/04/2020
; Description: Define some system macros and consts
; Github: https://github.com/MarcoMihaiCondrache
; LICENSE: GPL-3.0
io_int equ 21h
screen_int equ 10h
mouse_int equ 33h
out_fn equ 02h
so_fn equ 4ch

clear_reg macro
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    endm

clear macro
	mov     ax,0600h               
    mov     bh, 3                
    mov     cx,0000                
    mov     dx,184fh               
    int     screen_int             
	endm

delay macro th, tl
    xor     al, al
    mov     cx, th
    mov     dx, tl ; microseconds between cx:dx (ex 4c:4b40 = 5seconds)
    mov     ah, 86h ; function 86h of interrupt 15h (waits seconds before returning the control to the controller)
    int     15h
    endm

set_page macro page
    mov ah, 05h
    mov al, page
    mov current_page, page
    int screen_int
    endm

setvideo_mode macro ch
    mov al, ch
    mov ah, 0
    int screen_int
    endm

set_standard_cursor macro
    mov ch, 6
    mov cl, 7
    mov ah, 1
    int 10h
    endm

print_char macro ch
    mov ah, out_fn
    mov dl, ch
    int io_int
    endm

del_char macro
    print_char 8
    print_char 32
    print_char 8
    endm

print_string macro str
    mov dx, offset str
	mov ah, 9
	int io_int
    endm

ask_no_echo macro
    mov ah, 07
    int io_int
    endm

so_return macro
    mov ah, so_fn
    int io_int
    endm

move_xy macro x,y
    mov ah, 2
    mov dl, x
    mov dh, y
    mov bh, current_page
    int screen_int
    endm

hide_cursor macro
    mov ch, 32
    mov ah, 1
    int screen_int
    endm

; mouse

reset_mouse macro
    mov ax, 0000h
    int mouse_int
    endm

show_mouse macro
    mov ax, 1
    int mouse_int
    endm

hide_mouse macro
    mov ax, 2
    int mouse_int
    endm

status_mouse macro
    mov ax, 5
    mov bx, 0
    int mouse_int
    endm