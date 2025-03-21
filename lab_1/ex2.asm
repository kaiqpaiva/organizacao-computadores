.data #Sessão de declaração de strings
	
	#Strings de entrada
	N1: .asciiz "Digite o 1º número: "
	N2: .asciiz "Digite o 2º número: "
	N3: .asciiz "Digite o 3º número: "
	#Stings de saída
	maiorV: .asciiz "Maior valor: "
	intermV: .asciiz "Valor intermediário: "
	menorV: .asciiz "Menor valor: "
	pulaLinha: .asciiz "\n"
	
.text #Onde são escritas as intruções
main: #Define o ponto inicial do programa


	#Solicitação primeiro número
	#Para imprimir a frase N1
	li $v0, 4 #carrega 4 no registrador, cod pra imprimir no syscall (li = carregar int)
	la $a0, N1 #carrega end. de msg da N1 no regist.
	syscall #comando pra executar
	
	#Receber o input do N1
	li $v0, 5 #syscall 5 = ler inteiro -> armazena no $v0
	syscall
	move $t0, $v0 #transfere pro $t0 o numero do Sv0(regist temporário)
	
	#Solicitação segundo número
	#Para imprimir a frase N2
	li $v0, 4 
	la $a0, N2 
	syscall
	
	#Receber o input do N2
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Solicitação terceiro número
	#Para imprimir a frase N3
	li $v0, 4 
	la $a0, N3 
	syscall
	
	#Receber o input do N3
	li $v0, 5
	syscall
	move $t2, $v0
	
	#Encontrar maior número
	move $t3, $t0 #Assumindo N1 como maior, guarda no $t3(registrador do maior valor)
	blt $t3, $t1, oMaiorEhoN2 #se N2>N1, segue pro cod oMaiorEhoN2
	blt $t3, $t2, oMaiorEhoN3 #se N3>N1, segue pro cod oMaiorEhoN3
	j continua1 #Se N1 era o maior segue pra essa flag
	
	oMaiorEhoN2:
	move $t3, $t1 #Assume N2 é maior
	blt $t3, $t2, oMaiorEhoN3 #se N3>N2, segue pro cod oMaiorEhoN3
	j continua1 #Se N2 era o maior segue pra essa flag
	
	oMaiorEhoN3:
	move $t3, $t2 #assume o N3 como maior
	
	continua1:
	
	#Encontrar o menor número
	move $t4, $t0 #Assume N1 como menor num
	bgt $t4, $t1, oMenorEhoN2
	bgt $t4, $t2, oMenorEhoN3
	j continua2
	
	oMenorEhoN2:
	move $t4, $t1 #assume N2 como menor
	bgt $t4, $t2, oMenorEhoN3
	j continua2
	
	oMenorEhoN3:
	move $t4, $t2
	
	continua2:
	
	#Encontrar o intermediário
	#Comparação N1 com numeros maiores e menores
	bne $t0, $t3, ContinuaProN2 #Se N1 != maior
	bne $t0, $t4, continua3 #Se N1 != menor
	move $t5, $t0 #N1 é o intermediario, guarda no $t5
	j continua3 
	
	ContinuaProN2:
	bne $t1, $t3, ContinuaProN3
	bne $t1, $t4, continua3
	move $t5, $t1
	j continua3
	
	ContinuaProN3:
	move $t5, $t2
	
	continua3:
	
	#Exibir o maior valor
	li $v0, 4
	la $a0, maiorV
	syscall
	
	li $v0, 1 #o numero 1 é pra imprimir um numero int
	move $a0, $t3 #move o valor que está em $t3 pra $a0 pra poder imprimir (so imprime nos $a)
	syscall
	
	#pra nao imprimir na mesma linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#Exibir o valor intermediario
	li $v0, 4
	la $a0, intermV
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	#pra nao imprimir na mesma linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#exibir o menor valor
	li $v0, 4
	la $a0, menorV
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	#pra nao imprimir na mesma linha
	li $v0, 4
	la $a0, pulaLinha
	syscall
	
	#Finaliza o sistema
	li $v0, 10
	syscall