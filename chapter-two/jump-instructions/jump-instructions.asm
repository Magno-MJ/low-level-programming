mov rax, -1
mov rdx, 2

cmp rax, rdx
jg location
ja location   ; lógica diferente!

cmp rax, rdx
je location   ; se rax for igual a rdx
jne location  ; se rax for diferente de rdx
