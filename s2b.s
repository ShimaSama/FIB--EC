	.data
result: .word 0
num:	.byte ';'

	.text
	.globl main
main:

	la $t0,num
	lb $t0,0($t0)
	la $t7,result
	li $t1,'a'
	li $t2,'z'
	blt $t0,$t1,if	#num<a
	ble $t0,$t2,res #num<=z
if:	li $t1,'A'
	li $t2,'Z'
	blt $t0,$t1,else #num<A
	bgt $t0,$t2,else #num>Z
res: 	sw $t0,0($t7)
	b end
else:	li $t1,'0'
	li $t2,'9'
	blt $t0,$t1,res3 #num<0
	bgt $t0,$t2,res3 #num>9
	subu $t0,$t0,$t1
	sw $t0,0($t7)
	b end
res3:	li $t1,-1
	sw $t1,0($t7)
end:	jr $ra

