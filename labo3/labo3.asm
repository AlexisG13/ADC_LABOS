        org 100h 

section     .text

; Ejercicio 2

    mov 	bx, 0000h 
    mov 	cx, 0000h
    mov 	dx, 0000h
    mov	    ax, 2d
    mov	    cx, 2d
    mul 	cx  
    mov	    [210h], ax

looper1:	inc bx
            mul cx
            mov [bx+ 210h], ax
            cmp ax, 0xFF
            jb looper1

looper2:	inc bx
            mul cx
            inc bx
            mov [bx+ 210h], ax
            cmp bx, 12d
            jb looper2

; Ejercicio 3

	mov 	ax, 0000h
	mov 	bx, 0000h
	mov 	cx, 0000h
	mov 	dx, 0000h

	mov 	ax, 0d
    mov     bx, 1h
	mov 	dx, 1h

	mov 	[220h], ax
	mov 	[221h], dx

looper3:	
    	inc     bx
    	mov 	ax, 0000h
        mov 	cx, 0000h
        mov     ax, [220h+bx-1h]
        mov     cx, [220h+bx-2h] 
        add     ax, cx
        mov     [220h + bx], ax
        cmp     bx, 0xe
        jb looper3

; Ejercicio 1
        mov ax, 0000h ;limpiando AX
	    mov	bx, 0000h ;limpiando BX
        mov ax, 2d
        mov bx, 2d
        add ax, bx

        mov bx, 7d
        add ax, bx

        mov bx, 1d
        add ax, bx

        mov bx, 7d
        add ax,bx

        mov	dx, 0000h 
        mov	bx, 5d
        div	bx
        mov	[220h], ax
        mov	[221h], dx

        mov	di, 0d
        mov	cx, [len]

lupi:   mov 	bl, [comnt+di]
	    mov     [di +200h], bl
	    inc	    di
	    loop	lupi

    int	20h

section .data

comnt	db	"Me recupero"
len	equ	$-comnt

