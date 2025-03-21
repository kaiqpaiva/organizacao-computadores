.data #Sessão de declaração de strings
	
	#Strings de entrada
	N1: .asciiz "Digite o 1º número: "
	N2: .asciiz "Digite o 2º número: "
	N3: .asciiz "Digite o 3º número: "
	
	#Strings de saída
	maiorV: .asciiz "Maior valor: "
	intermV: .asciiz "Valor intermediário: "
	menorV: .asciiz "Menor valor: "
	pulaLinha: .asciiz "\n"
	
.text #Onde são escritas as instruções
main: #Define o ponto inicial do programa

	#Solicitação primeiro número
	li $v0, 4
	la $a0, N1
	syscall
	
	#Receber o input do N1
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Solicitação segundo número
	li $v0, 4 
	la $a0, N2 
	syscall
	
	#Receber o input do N2
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Solicitação terceiro número
	li $v0, 4 
	la $a0, N3 
	syscall
	
	#Receber o input do N3
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Encontrar maior número
	move $t3, $t0
	blt $t3, $t1, oMaiorEhoN2
	blt $t3, $t2, oMaiorEhoN3
	j continua1
	
	oMaiorEhoN2:
	move $t3, $t1
	blt $t3, $t2, oMaiorEhoN3
	j continua1
	
	oMaiorEhoN3:
	move $t3, $t2
	
	continua1:
	
	#Encontrar o menor número
	move $t4, $t0
	bgt $t4, $t1, oMenorEhoN2
	bgt $t4, $t2, oMenorEhoN3
	j continua2
	
	oMenorEhoN2:
	move $t4, $t1
	bgt $t4, $t2, oMenorEhoN3
	j continua2
	
	oMenorEhoN3:
	move $t4, $t2
	
	continua2:
	
	#Encontrar o intermediário (corrigido aqui)
	beq $t0, $t3, ContinuaProN2
	beq $t0, $t4, ContinuaProN2
	move $t5, $t0
	j continua3 
	
	ContinuaProN2:
	beq $t1, $t3, ContinuaProN3
	beq $t1, $t4, ContinuaProN3
	move $t5, $t1
	j continua3
	
	ContinuaProN3:
	move $t5, $t2
	
	continua3:
	
	#Exibir o maior valor
	li $v0, 4
	la $a0, maiorV
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	#Pular linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#Exibir o valor intermediário
	li $v0, 4
	la $a0, intermV
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	#Pular linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#Exibir o menor valor
	li $v0, 4
	la $a0, menorV
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	#Pular linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#Finaliza o sistema
	li $v0, 10
	syscall