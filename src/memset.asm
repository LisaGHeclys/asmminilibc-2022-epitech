BITS 64

section .text
global memset:function

memset:
    xor rcx, rcx                ;set rcx to 0
    jmp .loop                   ;jump to the loop

.loop:
    cmp rcx, rdx                ;compare if the counter is the same as the third argument
    je .end                     ;if true jumps to the end function
    mov BYTE[rcx + rdi], sil    ;set the second character to the right position of the first
    inc rcx                     ;increment the counter
    jmp .loop                   ;jumps back to the loop

.end:
    mov rax, rdi                ;move the result to the return value
    ret                         ;return rax and end the function
