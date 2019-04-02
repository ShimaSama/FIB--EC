	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0
resultat: .space 4
	.text 
	.globl main
main:

	addiu $sp,$sp,-4
	la $a0,mat
	sw $ra,0($sp)
	jal suma_col
	la $t0,resultat
	sw $v0,0($t0)
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra

suma_col:

	li $t0,0 #suma
	li $t2,0 #i
	addiu $t1,$a0,8 #adreça m[0][2]
	li $t2,0
	li $t3,4

bucle: lw $t4,0($t1) #$t2<- m[i++][2]
	addu $t0,$t0,$t4
	addiu $t1,$t1,24 #p apunta m[i++][2]
	addiu $t2,$t2,1 #++i
	blt $t2,$t3,bucle
	move $v0,$t0
	jr $ra






