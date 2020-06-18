org 	100h

section .text

	mov 	dx, msg
	call 	w_strng
	xor 	si, si 	
    
lupi:	call 	kb
    cmp 	al, "$"
    je	promedio
    sub al,30h 
    mov [240h+si], al
	inc 	si
	jmp 	lupi

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

promedio:
    ; Calcular promedio
    mov ax, 0000h 
	mov	bx, 0000h 
    mov al , [240h]
    mov bl , [241h]
    add al,bl
    mov bl , [242h]
    add al , bl
    mov bl , [243h]
    add al , bl
    mov bl , [244h]
    add al , bl 
    mov	dx, 0000h 
    mov	bl, 5d
    div	bl
    ; Mostrar el mensaje correcto
    mov dx, nl
    call w_strng 
    mov dx, msg2
    cmp al, 01h 
    je w_strng
    mov dx, msg3
    cmp al, 02h
    je w_strng
    mov dx, msg4
    cmp al, 03h
    je w_strng
    mov dx, msg5
    cmp al, 04h
    je w_strng
    mov dx, msg6
    cmp al, 05h
    je w_strng
    mov dx, msg7
    cmp al, 06h
    je w_strng
    mov dx, msg8
    cmp al, 07h
    je w_strng
    mov dx, msg9
    cmp al, 08h
    je w_strng
    mov dx, msg10
    cmp al, 09h
    je w_strng
    mov dx, msg11
    cmp al, 0Ah
    je w_strng

    int 20h

section .data
msg 	db 	"Ingrese los ultimos 5 digitos de su carnet con $ al final: $"
nl	db 	0xA, 0xD, "$"
msg2 	db 	" Solo necesito el 0 $"
nl2	db 	0xA, 0xD, "$"
msg3 	db 	"Aun se pasa $"
nl3	db 	0xA, 0xD, "$"
msg4 	db 	"Hay salud $"
nl4	db 	0xA, 0xD, "$"
msg5 	db 	"Me recupero $"
nl5	db 	0xA, 0xD, "$"
msg6 	db 	"En el segundo $"
nl6	db 	0xA, 0xD, "$"
msg7 	db 	"Peor es nada $"
nl7	db 	0xA, 0xD, "$"
msg8 	db 	"Muy bien $"
nl8	db 	0xA, 0xD, "$"
msg9 	db 	"Colocho $"
nl9	db 	0xA, 0xD, "$"
msg10 	db 	"Siempre me esfuerzo $"
nl10	db 	0xA, 0xD, "$"
msg11 	db 	"Perfecto solo Dios $"
nl11	db 	0xA, 0xD, "$"