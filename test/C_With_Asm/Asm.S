section .data
str: db "This is my_print hello world" 0xa, 0

section .text
extern print
global _start
_start:
    push str
    call print
    add esp, 4

    mov eax, 1
    int 0x80

global my_print
my_print:
    push ebp
    mov ebp, esp

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp+8]
    mov edx, [ebp+12]
    int 0x80
    pop ebp
    ret
    
