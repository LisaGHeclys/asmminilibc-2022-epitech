BITS 64

section .text
global strstr:function

strstr:
    mov rcx, 0                  ;set rcx to 0

.loop:
    cmp BYTE[rdi + rcx], '\0'   ;compare if the byte of rdi is the end of the string
    je .false                   ;then jumps to false function
    mov r9, 0                   ;init r9 to 0                       
    mov rdx, rcx                ;set the value of rcx to rdx

.check:
    movsx r10, BYTE[rdi + rdx]  ;
    movsx r11, BYTE[rsi + r9]   ;
    cmp r11, 0                  ;
    je .true                    ;
    cmp r10, 0                  ;
    je .false                   ;
    cmp r10, r11                ;
    jne .next                   ;
    inc rdx                     ;increment rdx
    inc r9                      ;increment r9
    jmp .check                  ;recursive call to check

.next:
    inc rcx                     ;increment rcx
    jmp .loop                   ;then jumps back to loop   

.true:
    add rdi, rcx                ;add rdi to rcx
    mov rax, rdi                ;set rax to the new value of rdi
    ret                         ;return rax and end the function

.false:
    mov r9b, BYTE[rsi + r9]     ;set the byte to r9b
    cmp BYTE[rdi + rdx], r9b    ;
    je .true                    ;jumps to true
    mov rax, 0                  ;set rax to 0 cuz it's false
    ret                         ;return rax and end the function