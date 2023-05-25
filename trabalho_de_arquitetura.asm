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


