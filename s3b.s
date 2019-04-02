	# Sessio 3

	.data 
	.align 2

mat1: 	.space 120
mat4: 	.word 2,3,1,2,4,3
col:	.word 2

	.text 
	.globl main
main:
	addiu $sp,$sp,12
	sw $ra,0($sp)
	sw $s0,4($sp) #mat1
	sw $s1,8($sp) #mat4
	la $s0,mat1
	la $s1,mat4
	move $a0,$s1 # ad mat4
	addiu $t0,$a0,8 # ad mat4 [0][2]
	lw $a1,0($t0)
	la $t0,col
	lw $a2,0($t0)
	jal subr
	sw $v0,108($s0) #guarda result a mat1[4][3]
	move $a0,$s1
	li $a1,1
	li $a2,1
	jal subr
	sw $v0,0($s0)
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addiu $sp,$sp,12
	jr $ra
	
	


subr:
	li $t0,3
	mult $t0,$a1 #3*i
	mflo $t0
	addu $t0,$t0,$a2 #(3*i)+j
	sll $t0,$t0,2 #(3*i+j)*4
	addu $t0,$t0,$a0 #++adreça
	lw $t0,0($t0)
	la $t2,mat1
	li $t1,24 #6*4
	mult $t1,$a2
	mflo $t1
	addu $t1,$t1,$t2 #++ad
	sw $t0,20($t1)
	move $v0, $a1
	jr $ra
	


