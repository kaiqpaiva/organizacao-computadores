.data

msg1: .asciiz "\nConversor de decimal para binário!\nDigite um número inteiro positivo: "
binario: .space 32 #vetor com 32 bits
erro: .asciiz "\nO número tem que ser inteiro e positivo."
retorno: .asciiz "\nO número em binario é: "

.text

main:
	#Pede o número
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Recebe o numero
	li $v0, 5
	syscall
	move $t0, $v0 #carrega o núm em $t0
	
	#validação
	ble $v0, $zero, invalido
	
	#função binario
	jal decimal_para_binario 
	
	#mensagem resultado:
	li $v0, 4
	la $a0, retorno
	syscall
	
	#Valor resultado
	jal imprimir
	
	#fim
	li $v0, 10
	syscall

invalido:

	#printa mentagem de invalido
	li $v0, 4
	la $a0, erro
	syscall
	j main
	
decimal_para_binario:

	li $t1, 2 #carrega divisor
	li $t2, 0 #inicia índice (qtd caracteres) zerado
	
	loop:
	divu $t0, $t1 #divide número pelo divisor
	mfhi $v0 #Resto $v0
	mflo $v1 #quociente $v1
	sb $v0, binario($t2) #Adiciona o resto no vetor na posição do índice
	
	move $t0, $v1 #move o quociente pro lugar do número
	addi $t2, $t2, 1 #incrementa índice
	bgtz $t0, loop
	
	move $s0, $t2 #salva o índice
	jr $ra #volta pra main
	
imprimir:

	move $t2, $s0 #pega o valor do índice1 de volta
	addi $t2, $t2, -1
	
	loop2:
	bltz $t2, fim2 #compara índice de qtd de caracteres do num binario com 0
	lb $a0, binario($t2)
	li $v0, 1
	syscall
	
	addi $t2, $t2 -1 #decrementa índice
	j loop2
	
	fim2:
	jr $ra #volta pro main