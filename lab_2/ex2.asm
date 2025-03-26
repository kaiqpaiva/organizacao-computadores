.data
	msg: .asciiz "Digite a qtd de termos: "  # Mensagem para solicitar entrada do usuário
	erro: .asciiz "Entrada invalida. Digite um numero maior que zero.\n" 
	virgula: .asciiz ", "                   # String contendo uma vírgula e espaço
	nova_linha: .asciiz "\n"                 # Quebra de linha

.text
main: 
	# Exibe a mensagem pedindo a quantidade de termos
	li $v0, 4
	la $a0, msg
	syscall
	
	# Lê um número inteiro digitado pelo usuário
	li $v0, 5
	syscall 
	move $a0, $v0  # Move o valor lido para $a0 (argumento da função)
	
	blez $a0, erro_entrada

	# Chama a função fibonacci
	jal fibonacci
	
	# Encerra o programa
	li $v0, 10
	syscall
	
erro_entrada:
	# Exibe a mensagem de erro
	li $v0, 4
	la $a0, erro
	syscall

	# Volta a solicitar entrada
	j main
	
fibonacci:
	# Inicializa os primeiros termos da sequência de Fibonacci
	li $t0, 0  # F0 = 0
	li $t1, 1  # F1 = 1
	move $t2, $a0  # Move a quantidade de termos para $t2
	
	# Imprime o primeiro termo (0)
	li $v0, 1
	move $a0, $t0
	syscall
	
	# Se o usuário pediu apenas 1 termo, termina a execução
	beq $t2, 1, fim_fibo
	
	# Imprime uma vírgula após o primeiro termo
	li $v0, 4
	la $a0, virgula
	syscall
	
	# Imprime o segundo termo (1)
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $t3, 2  # Inicializa contador com 2 (já imprimimos 2 termos)

loop:
	# Se já imprimimos a quantidade de termos desejada, termina a função
	beq $t3, $t2, fim_fibo
	
	# Calcula o próximo termo da sequência: F(n) = F(n-1) + F(n-2)
	add $t4, $t0, $t1
	move $t0, $t1   # Atualiza F(n-2) = F(n-1)
	move $t1, $t4   # Atualiza F(n-1) = F(n)
	
	# Imprime a vírgula antes do próximo número
	li $v0, 4
	la $a0, virgula
	syscall
	
	# Imprime o termo atual da sequência
	li $v0, 1
	move $a0, $t4
	syscall
	
	# Incrementa o contador
	addi $t3, $t3, 1
	j loop  # Continua o loop

fim_fibo:
	# Imprime uma quebra de linha para finalizar a saída
	li $v0, 4
	la $a0, nova_linha
	syscall
	
	# Retorna para a função chamadora
	jr $ra
