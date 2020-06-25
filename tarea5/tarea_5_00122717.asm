org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 106d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v

	mov 	si, 250d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v

	mov 	si, 106d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h1

	mov 	si, 106d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h2

	mov 	si, 165d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_v3

	mov 	si, 190d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h1

	mov 	si, 190d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_v2

	mov 	si, 106d ; X -> Columna
	mov 	di, 150d ; Y -> Fila
	call 	linea_h3

	mov 	si, 106d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	call 	linea_v2

	mov 	si, 106d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	call 	linea_h4

	mov 	si, 132d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	call 	linea_v3

	mov 	si, 132d ; X -> Columna
	mov 	di, 120d ; Y -> Fila
	call 	linea_h2

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h1: 
lupi_h1:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 250d
	jne 	lupi_h1
	ret

linea_h2: 
lupi_h2:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 165d
	jne 	lupi_h2
	ret

linea_h3: 
lupi_h3:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 190d
	jne 	lupi_h3
	ret

linea_h4: 
lupi_h4:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 132d
	jne 	lupi_h4
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 50d
	jne 	lupi_v
	ret

linea_v2:
lupi_v2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 150d
	jne 	lupi_v2
	ret

linea_v3:
lupi_v3:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 120d
	jne 	lupi_v3
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data