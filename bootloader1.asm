[BITS 16]
[ORG 0x7c00]


start:
    cli ;clear interrupts
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00 ; stack pointer 
    sti ;Enable interrupts
    mov si, msg


print:
    lodsb ;Loads byte at ds:si to AL Registers and increment SI
    cmp al, 0
    je done 
    mov ah, 0x0E
    int 0x01
    jmp print

done:
    cli 
    hlt ;Stop CPU further execution


msg: db 'Hello World!' , 0

times 510  - ($ - $$) db 0


dw 0xAA55