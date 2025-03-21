.data
msg: .asciiz "insira o numero: "
msg_par: .asciiz "é par!!!" 
msg_impar: .asciiz "é impar!!!" 

.text

main: 
	li $v0, 4
	la $a0, msg #Imprime a mensagem pedindo 
	syscall
			
	li $v0, 5 #Aqui vc faz a entrada do inteiro
	syscall 
	move $t0, $v0 #Move o inteiro pro registrador t0

	andi $t1, $t0 #Vai verificar o menor bit
	beqz $t1, par# Verifica se o bit é 0 ou 1, se for 0 par prossegue
	j impar# vai pro impar se o bit é 1

par:
	li $v0, 4
	la $a0, msg_par#imprime que é par
	syscall
	j fim#finaliza o programa

impar:
	li $v0, 4
	la $a0, msg_impar#imprime que é impar
	syscall
 
 fim:
	li $v0 10#finaliza o programa
	 syscall
