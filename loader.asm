%include "boot.inc"
SECTION MBR vstart=0x7c00

    mov ax, msg
    mov bp, ax    
    
    mov ax, 0x1301
    mov cx, 11
    mov bx, 0x2
    int 0x10

    jmp $

    msg db "hello world"
    
    times 510-($-$$) db 0
    db 0x55,0xaa
