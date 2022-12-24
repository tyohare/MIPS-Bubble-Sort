.data

array: .word 3, 0, 1, 2, 1, -2,6
sizeMone: .word 6
msg: .asciiz "Sorted: "
msg2: .asciiz " "

.text
.globl main

main:
	lw $s0, sizeMone
	#addi $s0,$zero,5 #s0 = 5
	addi $t0,$zero,0 #t0 = 0

in:

	la $a0,array
	addi $a1,$s0,1 #a1=6
	#call bubble_sort
	jal bubble_sort

	#print table
	li $v0,4
	la $a0,msg
	syscall
	la $t0,array
	#s0=5
	add $t1,$zero,$zero
	
print:
	lw $a0,0($t0)
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,msg2
	syscall
	
	addi $t0,$t0,4
	addi $t1,$t1,1
	slt $t2,$s0,$t1
	beq $t2,$zero,print

	li $v0,10
	syscall

bubble_sort:

	#a0=address of array
	#a1=size of array
	add $t0,$zero,$zero #counter1(i =0)

	loop1:
		addi $t0,$t0,1 #i++
		slt $t3,$t0, $a1
		beq $t3,$zero, endloop1
		add $t1,$a1,$zero #counter2 (j = size)
		
		loop2:
			slt $t3,$t0,$t1
			beq $t3, $zero, loop1

			addi $t1,$t1,-1 #j--
			sll $t4,$t1,2   #t4=&array[j]
			addi $t3,$t4,-4 #t3=&array[j-1]
			add $t7,$t4,$a0 #t7=array[j]
			add $t8,$t3,$a0 #t8=array[j-1]
			lw $t5,0($t7)
			lw $t6,0($t8)

			slt $t3,$t5,$t6
			beq $t3,$zero,loop2

			#swap t5,t6
			sw $t5,0($t8)
			sw $t6,0($t7)
			j loop2

	endloop1:
		jr $ra










