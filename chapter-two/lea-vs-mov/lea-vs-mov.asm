; rsi <- endereço do rótulo 'codes', um número
mov rsi, codes

; rsi <- conteúdo da memória, começando no endereço 'codes'
; 8 bytes consecutivos são obtidos porque o tamanho de rsi é de 8 bytes
mov rsi, [codes]

; rsi <- endereço de 'codes'
; neste caso, é equivalente a mov rsi, codes
; em geral, o endereço pode conter vários componentes
lea rsi, [codes]


; rsi <- conteúdo da memória, começando em (codes + rax)
mov rsi, [code + rax]

; rsi <- codes + rax
; equivalente à combinação:
; -- mov rsi, codes
; -- add rsi, rax
; Não é possível fazer isto com um único mov!
lea rsi, [codes + rax]
