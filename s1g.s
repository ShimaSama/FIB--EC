.data
fib:	.space 40


	.text
	.globl main
main:
	li $s0,2
	la $s1,fib
	sw $zero, 0($s1)
	li $t1,1
	sw $t1,4($s1)
while: 
	slti $t0,$s0,10
	beq $t0,$zero,fi
	
	sll $s2,$s0,2
	addu $t2,$s1,$s2
	lw $t3,-4($t2)
	lw $t4,-8($t2)
	addu $t4,$t4,$t3
	sw $t4,0($t2)
	
	addiu $s0,$s0,1
	b while
fi:
	jr $ra	
			