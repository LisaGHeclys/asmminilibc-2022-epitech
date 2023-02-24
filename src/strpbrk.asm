BITS 64

section .text
global strpbrk:function

strpbrk:
    mov rcx, 0                  ;set return value to 0

loop:
    mov r9b, BYTE [rdi + rcx]   ;get char first string
    cmp r9b, 0                  ;cmp to end string
    je  .end                    ;not found
    mov r10, 0                  ;set counter to 0
    jmp .finder                 ;jumps to finder

.finder:
    cmp BYTE [rsi + r10], r9b   ;
    je  .true                   ;
    cmp BYTE [rsi + r10], 0     ;
    je  .incr                   ;
    inc r10                     ;
    jmp .finder                 ;

.incr:
    inc rcx                     ;increment rcx
    jmp loop                    ;jump to loop

.true:
    mov rax, rdi                ;set rax to the new value of rdi
    add rax, rcx                ;add rcx to rax
    ret                         ;return rax and end the function

.end:
    mov rax, 0                  ;set rax to 0 cuz it's false
    ret                         ;return rax and end the function