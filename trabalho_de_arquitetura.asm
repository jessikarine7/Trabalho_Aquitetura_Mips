.data
	menu: .asciiz "\n\n1- Fahrenheit -> Celsius\n2- Fibonnacci\n3- Enesimo par\n4-- Sair\nEscolha uma opção:"

	conv_prompt: .asciiz "\nDigite uma temperatura em Fahrenheit: "
	conv_resultado: .asciiz "A temperatura convertida em Celsius é: "
	conv_num1: .float 25.0
	conv_num2: .float 2.0
	conv_num3: .float 11.0
	
	fibo_prompt: .asciiz "\nDigite o enésimo termo da sequência de Fibonnacci: "
	fibo_resultado: .asciiz " é o enésimo termo."
	
	par_prompt:  .asciiz "\nDigite o enésimo par: "
	par_resultado:  .asciiz "O enesimo valor correspondendte deste numero é: "
	
	msg: .asciiz "\nFinalizado :)\n"

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
	la $a0, conv_prompt
	li $v0, 4			
	syscall

	li $v0, 6
	syscall

	l.s $f1, conv_num1
	l.s $f2, conv_num2
	l.s $f3, conv_num3
	
	sub.s $f0, $f0, $f1
	mul.s $f0, $f0, $f2
	div.s $f0, $f0, $f3
	
	la $a0, conv_resultado
	li $v0, 4
	syscall
	
	mov.s $f12, $f0
	li $v0, 2      
	syscall
	jal main			