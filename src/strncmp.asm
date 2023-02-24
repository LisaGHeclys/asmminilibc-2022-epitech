BITS 64

section .text
global strncmp:function

strncmp:
    xor rcx, rcx                ;set rcx to 0
    mov r8b, 0
    mov r9b, 0
    cmp rdx, 0
    je .end
    jmp .loop                   ;jump to the loop

.loop:
    cmp rcx, rdx                ;verify if the increment equals to the third value
    je .end                     ;jumps to the end
    mov r8b, BYTE[rdi + rcx]
    mov r9b, BYTE[rsi + rcx]
    cmp r8b, 0                  ;verify if the first string isn't at \0
    je .end                     ;jumps to the end
    cmp r9b, 0                  ;verify if the second string isn't at \0
    je .end                     ;jumps to the end
    cmp r8b, r9b                ;set the second character to the right position of the first
    jne .end                    ;jumps to the end function
    inc rcx                     ;increment the counter
    jmp .loop                   ;jumps to the loop and start incrementing

.end:
    sub r8b, r9b                ;if the subs == 0 then return true
    movsx rax, r8b              ;set back the return value to the sub of the strings
    ret                         ;return rax and end the function
