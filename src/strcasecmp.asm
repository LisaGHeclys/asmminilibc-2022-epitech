BITS 64

section .text
global strcasecmp:function

strcasecmp:
    xor rcx, rcx
    cmp byte[rdi+rcx], 0
    je end_empty_s1
    cmp byte[rsi+rcx], 0
    je end_empty_s2

loop:
    mov al, byte [rdi + rcx]
    mov ah, byte [rsi + rcx]
    test al, al
    jz strcmp_end
    test ah, ah
    jz strcmp_end
    cmp al, "Z"
    jle s1_lower

check_s2:
    cmp ah, "Z"
    jle s2_lower

check_diff_s1_s2:
    inc rcx
    cmp al, ah
    je loop
    jmp strcmp_end

s1_lower:
    cmp al, "A"
    jge s1_add_32
    jmp check_s2

s1_add_32:
    add al, 32
    jmp check_s2

s2_lower:
    cmp ah, "A"
    jge s2_add_32
    jmp check_diff_s1_s2

s2_add_32:
    add ah, 32
    jmp check_diff_s1_s2

strcmp_end:
    sub al, ah
    movsx rax, al
    ret

end_empty_s1:
    mov al, byte [rdi + rcx]
    mov ah, byte [rsi + rcx]
    test ah, ah
    jz strcmp_end
    add ah, 32
    sub al, ah
    movsx rax, al
    ret

end_empty_s2:
    mov al, byte [rdi + rcx]
    mov ah, byte [rsi + rcx]
    add al, 32
    sub al, ah
    movsx rax, al
    ret