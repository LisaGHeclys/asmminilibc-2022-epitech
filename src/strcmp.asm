BITS 64

section .text
global strcmp:function

strcmp:
    xor rcx, rcx                ;set rcx to 0
    jmp .loop                   ;jump to the loop

.loop:
    mov r8b, BYTE[rdi + rcx]
    mov r9b, BYTE[rsi + rcx]
    cmp r8b, 0                  ;verify if the first string isn't at \0
    je .end                     ;jumps to the end
    cmp r9b, 0                  ;verify if the second string isn't at \0
    je .end                     ;jumps to the end
    cmp r8b, r9b                ;set the second character to the right position of the first
    jne .end                    ;jumps to the end function
    inc rcx                     ;increment the counter
    jmp .loop                   ;jumps back to the loop

.end:
    sub r8b, r9b                ;if the subs == 0 then return true
    movsx rax, r8b              ;set back the return value to the sub of the strings
    ret                         ;return rax and end the function
