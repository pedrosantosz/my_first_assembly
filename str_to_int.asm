JMP start
    
string: DB "255"     ; String a ser convertida
        DB 0         ; Terminador de string

start:
    MOV C, string    ; Aponta C para o início da string
    CALL str_to_int  ; Chama a rotina de conversão
    HLT              ; Para a execução (resultado está em A)

str_to_int:
    MOV A, 0         ; Inicializa acumulador com 0
    
.loop:
    MOV B, [C]       ; Pega o próximo caractere
    CMP B, 0         ; Verifica se é o terminador
    JE .end          ; Se for, termina

    SUB B, '0'       ; Subtrai 0x30 de B convertendo char para número       
    MUL 10           ; Multiplica A por 10 (trocando de uni/dez/cent)
    ADD A, B         ; Incrementa em A o dígito convertido
    
    INC C            ; Avança para próximo caractere
    JMP .loop
    
.end:
    RET
