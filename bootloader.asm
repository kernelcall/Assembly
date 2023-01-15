xor ax, ax; move o valor de ax para ax = 0
mov es, ax; move o valor de es para ax = 0
mov ds, ax; move o valor de ds para ax = 0
mov ss, ax; move o valor de ss para ax = 0

mov al, 0x13; move al para 0x13 invocando o serviço de escrita em modo pixel
int 0x10; faz a interrupção invocando o serviço especificado em al

mov ah, 0x0C; 
mov al, 0x0F
xor cx, cx
xor dx, dx
mov bh, 0x00
aqui:
int 0x10
inc cx
cmp cx, 319
jl aqui

int 0x10
inc dx
cmp dx, 200
jl aqui2

aqui2:
int 0x10
inc dx
cmp dx, 200
jl aqui2

xor cx, cx
mov dx, 199
aqui3:
int 0x10
inc cx
cmp cx, 319
jl aqui3

xor cx, cx
xor dx, dx
aqui4:
int 0x10
inc dx
cmp dx, 200
jl aqui4

;frase
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax

mov ah, 0x13
mov al, 0x01
mov bh, 0x00
mov bl, 0x0f
mov cx, 0x18
mov dh, 0x0a
mov dl, 0x0a
mov bp, frase
add bp, 0x7C00

int 0x10

mov ah, 0x13
mov al, 0x01
mov bh, 0x00
mov bl, 0x0f
mov cx, 0x17
mov dh, 0x0b
mov dl, 0x0b; Move a posição vertical
mov bp, frase2; Move o endereço de frase2 para BP
add bp, 0x7C00; Adiciona o endereço 0x7C00 a BP

int 0x10; Faz a interrupção de vídeo e serviços de tela

jmp $; pula para onde está o código
frase: db 'Meu Primeiro BootLoader', 0x0a;Variavel que armazena a mensagem
frase2: db 'Iniciando o sistema...', 0x0a;Variavel que armazena a mensagem


times 510 - ($ - $$) db 0x00; Preenche todo o espaço com 0 para formar os 510 bytes
dw 0xAA55; Assinatura de boot

 
