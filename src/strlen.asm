BITS 64

section .text
global strlen:function

strlen:                 ;int strlen(const char *string)
    XOR rax, rax        ;set variable to 0
    JMP loop            ;jump in the loop to count the number of char

loop:
    CMP BYTE[rdi], 0x00 ;compare if the char is a \0
    JE end              ;if it's true then end the programm
    INC rax             ;increment the counter
    INC rdi             ;increment the string
    JMP loop            ;recursive call of loop

end:
    ret                 ;return the counter