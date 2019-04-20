	.data
signe:		.word 0
exponent:	.word 0
mantissa:	.word 0
cfixa:		.word 0x87D18A00
cflotant:	.float 0.0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)

	la	$t0, cfixa
	lw	$a0, 0($t0)
	la	$a1, signe
	la	$a2, exponent
	la	$a3, mantissa
	jal	descompon

	la	$a0, signe
	lw	$a0,0($a0)
	la	$a1, exponent
	lw	$a1,0($a1)
	la	$a2, mantissa
	lw	$a2,0($a2)
	jal	compon

	la	$t0, cflotant
	swc1	$f0, 0($t0)

	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra


descompon:

	slt $t1,$a0,$zero #cf<0
	sw $t1,0($a1) 
	sll $a0,$a0,1  #elimina num
	bne $a0,$zero,else #cf!=0
	li $t3,0 #exp=3
	b final 
else:
	li $t3,18
bucle: 
	blt $a0,$zero,fuera #if cf<0, fuera del bucle
	sll $a0,$a0,1
	addiu $t3,$t3,-1 #exp --
	b bucle
fuera: 
	srl $a0,$a0,8 #cf >> 8
	li $t7,0x7FFFFF
	and $a0,$a0,$t7
	addiu $t3,$t3,127
final:
	sw $t3,0($a2)
	sw $a0,0($a3)
	jr $ra
	
	

compon:
	sll $v0,$a0,31
	sll $a1,$a1,23
	or $v0,$v0,$a1
	or $v0,$v0,$a2
	mtc1 $v0,$f0
	jr $ra

