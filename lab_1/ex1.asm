.data 
	N1: .asciiz "Digite o primeiro numero: "
	N2: .asciiz "Digite o segundo numero: "
	Resultado: .asciiz "Resultado igual a: "
	Menu: .asciiz "\nMenu: \n"
	Soma: .asciiz "1. Soma \n"
	Subt: .asciiz "2. Subtração \n"
	Mult: .asciiz "3. Multiplicação \n"
	Div: .asciiz "4. Divisão \n"
	Sair: .asciiz "5. Sair \n"
	Opcao: .asciiz "Escolha a operação (1/2/3/4/5): "
	Quo: .asciiz "Quociente : "
	Res: .asciiz "Resto: "
	N: .asciiz "\n"
	
.text
main: 
	# Exibe o menu de opções
	li $v0, 4
	la $a0, Menu
	syscall
	
	li $v0, 4
	la $a0, Soma
	syscall
	
	li $v0, 4
	la $a0, Subt
    	syscall
	
	li $v0, 4
	la $a0, Mult
	syscall
	
	li $v0, 4
	la $a0, Div
	syscall
	
	li $v0, 4
	la $a0, Sair
	syscall
	
	li $v0, 4
	la $a0, Opcao
	syscall
	
	# Lê a opção do usuario
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Armazena os valores para comparação
	li $t1, 1 # Soma
	li $t2, 2 # Subtração
	li $t3, 3 # Multiplicação
	li $t4, 4 # Divisão
	li $t5, 5 # Sair
	
	# Compara a opção escolhida e desvia para a operação correspondente 
	beq $t0, $t1, soma
	beq $t0, $t2, subtracao
	beq $t0, $t3, multiplicacao
	beq $t0, $t4, divisao
	beq $t0, $t5, sair	

	j main
	
soma: 
	# Exibe a mensagem pedindo o primeiro número
	li $v0, 4
	la $a0, N1
	syscall
	
	# Lê o primeiro número
	li $v0, 5
	syscall
	move $t6, $v0
	
	# Exibe a mensagem pedindo o segundo número
	li $v0, 4
	la $a0, N2
	syscall 
	
	# Lê o segundo número
	li $v0, 5
	syscall
	move $t7, $v0
	
	# Faz a adição
	add $t8, $t6, $t7
	
	# Exibe a mensagem "Resultado igual a:"
	li $v0, 4
	la $a0, Resultado
	syscall
	
	# Exibe o resultado da soma
	li $v0, 1
	move $a0, $t8
	syscall
	
	# Retorna ao menu principal
	j main

subtracao: 
	# Exibe a mensagem pedindo o primeiro número
	li $v0, 4
	la $a0, N1
	syscall 
	
	# Lê o primeiro número
	li $v0, 5
	syscall
	move $t6, $v0
	
	# Exibe a mensagem pedindo o segundo número
	li $v0, 4
	la $a0, N2
	syscall
	
	# Lê o segundo número
	li $v0, 5
	syscall
	move $t7, $v0
	
	# Realiza a subtração
	sub $t8, $t6, $t7
	
	# Exibe a mensagem "Resultado igual a:"
	li $v0, 4
	la $a0, Resultado
	syscall
	
	# Exibe o resultado da subtração
	li $v0, 1
	move $a0, $t8
	syscall
	
	# Retorna ao menu principal
	j main
	
multiplicacao: 
	# Exibe a mensagem pedindo o primeiro número
	li $v0, 4
	la $a0, N1
	syscall 
	
	# Lê o primeiro número
	li $v0, 5
	syscall
	move $t6, $v0
	
	# Exibe a mensagem pedindo o segundo número
	li $v0, 4
	la $a0, N2
	syscall
	
	# Lê o segundo número
	li $v0, 5
	syscall
	move $t7, $v0
	
	# Realiza a multiplicação
	mul $t8, $t6, $t7
	
	# Exibe a mensagem "Resultado igual a:"
	li $v0, 4
	la $a0, Resultado
	syscall
	
	# Exibe o resultado da multiplicação
	li $v0, 1
	move $a0, $t8
	syscall
	
	# Retorna ao menu principal
	j main
	
divisao: 
	# Exibe a mensagem pedindo o primeiro número
	li $v0, 4
	la $a0, N1
	syscall 
	
	# Lê o primeiro número
	li $v0, 5
	syscall
	move $t6, $v0
	
	# Exibe a mensagem pedindo o segundo número
	li $v0, 4
	la $a0, N2
	syscall
	
	# Lê o segundo número
	li $v0, 5
	syscall
	move $t7, $v0
	
	# Realiza a divisão
	div $t6, $t7
	
	# Exibe a mensagem "Quociente :"
	li $v0, 4
	la $a0, Quo
	syscall
	
	# Exibe o quociente
	li $v0, 1
	mflo $a0 # Carrega o quociente de $lo para $a0
	syscall
	
	# Exibe uma nova linha
	li $v0, 4
	la $a0, N
	syscall
	
	# Exibe a mensagem "Resto:"
	li $v0, 4
	la $a0, Res
	syscall
	
	# Exibe o resto
	li $v0, 1
	mfhi $a0 # Carrega o resto de $hi para $a0
	syscall
	
	# Retorna ao menu principal
	j main
	
sair:
	li $v0, 10 # Syscall para terminar o programa
	syscall	
