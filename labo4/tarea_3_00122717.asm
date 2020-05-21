	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase1
	call 	phrase2
	call 	phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr1:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 5d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase1:	mov 	di, 10d
lupi:	mov 	cl, [ver1+di-10d]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 12d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase2:	mov 	di, 30d
lupi2:	mov 	cl, [ver2+di-30d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret


m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 19d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase3:	mov 	di, 5d
lupi3:	mov 	cl, [ver3+di-5d]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

section .data
ver1	db 	"Por eso esperaba con la carita empapada"
len1 	equ	$-ver1+10d
ver2	db  "A que llegaras con rosas, con mil rosas para mi"
len2	equ	$-ver2+30d
ver3	db  "Porque ya sabes que me encantan esas cosas"
len3	equ	$-ver3+5d