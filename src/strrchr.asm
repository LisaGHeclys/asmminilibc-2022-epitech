BITS 64

section .text
global strrchr:function

strrchr:
    mov rax, 0x0
    jmp .loop

.loop:
    cmp BYTE[rdi], sil          ;compare if the input is the same as the string[i]
    je .add                     ;calls the .add function
    cmp BYTE[rdi], 0x0          ;compare to the end of string \0
    je .end                     ;jump to default end if the string + int equals \0
    inc rdi                     ;accumulator
    jmp .loop                   ;recursive call of loop

.add:
    mov rax, rdi                ;return value is equals to rcx
    cmp BYTE[rdi], 0x0          ;compare to the end of string \0
    je .end
    inc rdi                     ;rdi is equal to 1
    jmp .loop                   ;jump back to loop to get the last value

.end:
    ret                         ;return rax and end the function
