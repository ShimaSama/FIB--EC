.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

.text
.globl main
main:
    	addiu 	$sp, $sp, -4
    	sw    	$ra, 0($sp)
    	la    	$a0, w
    	li    	$a1, 31
    	jal    	moda
    	la    	$s0, resultat
    	sb    	$v0, 0($s0)
    	move    $a0, $v0
    	li    	$v0, 11
    	syscall
    	lw    	$ra, 0($sp)
    	addiu   $sp, $sp, 4
    	jr     	$ra

nofares:
    	li    	$t0, 0x12345678
    	move    $t1, $t0
    	move    $t2, $t0
    	move    $t3, $t0
    	move    $t4, $t0
    	move    $t5, $t0
    	move    $t6, $t0
    	move    $t7, $t0
    	move    $t8, $t0
    	move    $t9, $t0
    	move    $a0, $t0
    	move    $a1, $t0
    	move    $a2, $t0
    	move    $a3, $t0
    	jr    	$ra


moda:   addiu   $sp, $sp, -56
    	sw    	$s0, 40($sp)
    	sw    	$s1, 44($sp)
    	sw    	$s2, 48($sp)
    	sw    	$ra, 52($sp)
    	move    $s0, $a0
    	move    $s1, $a1
    	li    	$s2, 0
    	li    	$t0, 10
for:    sll    	$t3, $s2, 2
    	addu    $t3, $t3, $sp
    	sw    	$zero, 0($t3)
    	addiu 	$s2, $s2, 1
    	bne    	$s2, $t0, for
    	li    	$t1, 48
    	li    	$s2, 0
bucle:  bge    	$s2, $s1, fimoda
    	move    $a0, $sp
    	addu    $t3, $s0, $s2
    	lb    	$t3, 0($t3)
    	addiu 	$a1, $t3, -48
    	addiu 	$a2, $t1, -48
    	jal    	update
    	addiu 	$t1, $v0, 48
    	addiu  	$s2, $s2, 1
    	b 	bucle
fimoda: lw    	$s0, 40($sp)
    	lw    	$s1, 44($sp)
    	lw    	$s2, 48($sp)
    	lw    	$ra, 52($sp)
    	addiu   $sp, $sp, 56
    	move    $v0, $t1
    	jr    	$ra



update: addiu   $sp, $sp, -16
    	sw    	$s0, 0($sp)
    	sw    	$s1, 4($sp)
    	sw    	$s2, 8($sp)
    	sw    	$ra, 12($sp)
    	move    $s0, $a0 #*h
    	move    $s1, $a1 #i
    	move    $s2, $a2 #imax
    	jal    	nofares
    	sll     $t0, $s1, 2
    	addu    $t0, $t0, $s0
    	lw     	$t1, 0($t0) #h[i]
    	addiu	$t1, $t1, 1 #++h[i]
    	sw	$t1, 0($t0)
    	sll    	$t0, $s2, 2
    	addu    $t0, $t0, $s0
    	lw    	$t2, 0($t0) #h[imax]
    	ble    	$t1, $t2, else
    	move 	$v0, $s1
    	b     	fiupd
else:   move  	$v0, $s2
fiupd:  lw    	$s0, 0($sp)
    	lw    	$s1, 4($sp)
    	lw    	$s2, 8($sp)
    	lw    	$ra, 12($sp)
    	addiu 	$sp, $sp, 16
    	jr    	$ra