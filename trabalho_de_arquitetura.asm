# Trabalho de Assembly MIPS realizado por Jéssica Karine Santos

.data
	menu: .asciiz "\n\n1- Fahrenheit -> Celsius\n2- Fibonnacci\n3- Enesimo par\n4- Sair\nEscolha uma opção:"

	conversao_input: .asciiz "\nDigite uma temperatura em Fahrenheit: "
	conversao_resultado: .asciiz "A temperatura convertida em Celsius é: "
	conversao_num1: .float 25.0
	conversao_num2: .float 2.0
	conversao_num3: .float 11.0
	
	fibonnacci_input: .asciiz "\nDigite o enésimo termo da sequência de Fibonnacci: "
	fibonnacci_resultado: .asciiz "é o enésimo termo."
	
	enesimo_par_input:  .asciiz "\nDigite o enésimo par: "
	enesimo_par_resultado:  .asciiz "O enésimo par correspondente deste numero é: "
	
	msg: .asciiz "\nFinalizado\n"
	
.text

.globl main
	
main: 						
	la $a0, menu
	li $v0, 4
	syscall
	
	li $v0, 5			
	syscall
	
	move $t0, $v0
	
	beq $t0, 1, conversao	
	beq $t0, 2, sair

conversao:
	la $a0, conversao_input
	li $v0, 4			
	syscall

	li $v0, 6
	syscall

	l.s $f1, conversao_num1
	l.s $f2, conversao_num2
	l.s $f3, conversao_num3
	
	sub.s $f0, $f0, $f1
	mul.s $f0, $f0, $f2
	div.s $f0, $f0, $f3
	
	la $a0, conversao_resultado
	li $v0, 4
	syscall
	
	mov.s $f12, $f0
	li $v0, 2      
	syscall
	jal main	

fibonnacci:
	la $a0, fibonnacci_input
	li $v0, 4
	syscall
	li $v0, 5			
	syscall
	

	la	$a0, ($v0)
	jal	fibo
	move 	$a0, $v0
	
fibo:	
        addiu	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	
	addiu	$s0, $a0, 0
	beq	$0, $s0, feito
	addiu	$t0, $0, 1
	beq	$t0, $s0, feito
	
	addiu	$a0, $s0, -1
	jal	fibo
	addiu	$s1, $v0, 0
	addiu	$a0, $s0, -2
	jal	fibo
	addu	$v0, $v0, $s1

feito:	
        addu	$v0, $0, $s0
			
	
enesimo_par:
	la    $a0, enesimo_par_input
 	li    $v0, 4
	syscall

	li    $v0, 5      
	syscall
	
	move $t0 , $v0
	
	li $t1 , 1
	li $t2 , 0
	
laco:
	bgt $t1, $t0, print_enesimo_par
	
	addi $t1,$t1,1
	
	addi $t2,$t2,2
	j laco
	
print_enesimo_par:
	
	la $a0, enesimo_par_resultado
	li $v0, 4
	syscall

	li $v0, 1
	move $a0, $t2
	syscall
	jal main

sair:		
	la $a0, msg
	li $v0, 4			
	syscall	
			
	li $v0, 10
	syscall
