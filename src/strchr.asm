BITS 64

section .text
global strchr:function

strchr:
        mov rcx, 0

.loop:
        cmp BYTE[rcx + rdi], sil    ;compare if the input is the same as the char in the string
        je .res                     ;if true, then jump to res
        cmp BYTE[rcx + rdi], 0x0    ;compare to the end of string \0
        je .end                     ;jump to default end if the string + int equals \0
        inc rcx                     ;accumulator
        jmp .loop                   ;recursive call of loop

.end:
        mov rax, 0                  ;rax == 0
        ret                         ;return value + end the function

.res:
        add rcx, rdi                ;cut the string where the first occurence is
        mov rax, rcx                ;set the new string to the return value
        ret                         ;return value + end the function
