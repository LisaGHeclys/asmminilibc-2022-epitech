BITS 64

section .text
global strcspn:function

strcspn:
    mov rcx, 0                  ;set return value to 0

loop:
    mov r9b, BYTE[rdi + rcx]    ;get char first string
    cmp r9b, 0                  ;cmp to end string
    je .end                     ;not found
    mov r10, 0                  ;set counter to 0
    jmp .finder                 ;jump to finder

.finder:
    cmp BYTE[rsi + r10], r9b    ;compare if the byte equals to the set value
    je .end                     ;true = end
    cmp BYTE[rsi + r10], 0      ;compare if it's equal to 0
    je .incr                    ;jumps to increment
    inc r10                     ;increment the return value
    jmp .finder                 ;recursive call of finder

.incr:
    inc rcx                     ;inc rcx
    jmp loop                    ;jumps back to loop

.end:
    mov rax, rcx                ;set the incremented value to the return value
    ret                         ;return rax and end the function