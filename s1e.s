	.data
A:	.word 3,5,7 
punter:	.word 0

	.text
	.globl main
main:
	la $t2,A
	la $t3,punter
	addiu $t2, $t2, 8
	sw $t2, 0($t3)
	
	lw $t5,0($t3)
	lw $t5,0($t5)
	addiu $s0,$t5,2
	
	lw $t7,0($t3)
	addiu $t7,$t7,-8
	lw $t7,0($t7)
	addu $s0,$t7,$s0
	
	la $t5,A
	sw $s0,4($t5)
	
	li $v0,1
	move $a0,$s0
	syscall
	
	jr $ra
	

	            

	jr	$ra		# Retorna


,