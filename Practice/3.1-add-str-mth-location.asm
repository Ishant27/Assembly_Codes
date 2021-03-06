;n 32-bit data are stored starting from memory location dat1.
;Write an ALP that will insert the string “????”  after every mth  double word 
;The value of m can range between 2 to 4 and is stored in location off1. 
;The value of n is between 10d to 120d and is stored in location cnt1. 
;The size n need not be a multiple of m

.model tiny
.486 
.data
	dat1 dd "4321", "8765", "4321", "8765","4321", "8765","4321", "8765","4321", "8765"
	areaforinc dd 40 dup(?)	;VERY IMP TO KEEP BUFFER SPACE AS DATA SIZE GOING TO INCREASE 
	temp dd 40 dup(?)
	cnt1 db 10
	off1 db 2
.code
.startup
	lea si, dat1
	lea di, temp
	movzx cx, cnt1
	mov edx, "????"

	cld
	rep movsd ;copy all to a temporary location
	;DAT1 is copied to temp and then temp is read and stored back to dat1 with proper '????' instruction
	
	movzx cx, cnt1
	mov bl, off1
	mov ax,cx 
	div bl

	mov ah, 00
	add cx, ax	;

	lea si, temp
	lea di, dat1

	mov bl, 0

x3:	
	mov eax, [si]
	cmp bl, off1
	jnz x1
	mov [di], edx
	mov bl, -1
	jmp x2

x1: 
	mov [di], eax
	add si,4

x2:	
	add di, 4
	inc bl
	loop x3

.exit 
end