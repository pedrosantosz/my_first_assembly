JMP start

start:
    MOV A, 255      ; Atribui a A o valor a ser convertido
    MOV D, 234      ; Salva o endereço 0xEA (3 slot de saída) em D
    CALL int_to_str ; Chama a sub-rotina de conversão
    HLT             ; Para a execução

int_to_str:         ; Sub-rotina de conversão

.loop:
    MOV B, A        ; Salva o valor Atual de A em B
    DIV 10          ; Divide A por 10 (para pegar uni,dez,cent)
    MOV C, A        ; Salva temporariamente o valor de A
    MUL 10          ; Multiplica A por 10 (para subtrair)
    SUB B, A        ; Subtrai A de B, resultando no Resto da div
    MOV A, C        ; Restaura o valor de A

    ADD B, '0'      ; Soma B com 0x30, "convertendo" para char
    MOV [D], B      ; Aponta p/ o endereço atual de D guardando o char
    DEC D           ; Decrementa o valor de D para recuar um endereço

    CMP A, 0        ; Compara A com 0
    JNZ .loop       ; Se não for 0, volta pro começo
         
    RET             ; Se for 0, retorna onde a rotina fora chamada
