global _start

section .data

test_string: db "abcdef", 0

section .text

strlen:           ; de acordo com a nossa convenção, o primeiro e único argumento
                  ; é obtido de rdi 
    xor rax, rax  ; rax armazenará o tamanho da string. Se não for
                  ; zerado antes, seu valor será totalmente aleatório

.loop:            ; o laço principal começa aqui
    cmp byte [rdi + rax], 0 ; Verficia se o símbolo atual é o finalizador nulo
                  ; Definitivamente precisamos do modificador 'byte', pois
                  ; a parte à esquerda e à direita de cmp devem ter
                  ; o mesmo tamanho. O operando à direita é imediato
                  ; e não contêm nenhuma informação sobre o seu tamanho,
                  ; dese modo, não sabemos quantos bytes devem ser
                  ; obtidos da memória e comparados com zero
    je .end       ; Jump se o finalizador nulo foi encontrado
    inc rax       ; Caso contráro, vai para o próximo símbolo e incrementa
                  ; o contador
    jmp .loop

.end:
    ret           ; Quando 'ret' for alcançado, rax deverá armazenar o valor de retorno

_start:

    mov rdi, test_string
    call strlen
    mov rdi, rax
    
    mov rax, 60
    syscall
