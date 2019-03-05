.data
cadena:	.byte -1,-1,-1,-1,-1,-1
vec:	.word 5,6,8,9,1


	.text
	.globl main
main:

	li $s0,0
	
while: 
	li $t0, 5
	bge $s0,$t0,fi
	
	la $t1,cadena
	la $t2,vec
	sll $s1,$s0,2
	li $t3,16
	
	addu $t3,$t2,$t3
	subu $t3,$t3,$s1
	lw $t5,0($t3)
	addiu $t5,$t5, '0'
	addu $t1,$t1,$s0
	sb $t5,0($t1)
	addiu $s0,$s0,1
	b while
fi:
	li $t7,0
	la $t2,cadena+5
	sb $t7,0($t2)
	
	li $v0,4
	la $a0, cadena
	syscall
	
	jr $ra
		