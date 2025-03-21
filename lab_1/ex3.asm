.data
	senha: .asciiz "Digite a senha: "
	iguais: .asciiz "As senhas são iguais!\n"
	diferentes: .asciiz "As senhas são diferentes!\n"

.text
main: 
	# Senha padrão
	li $t0, 123456 
	
	# Printa 'Digite a Senha: '
	li $v0, 4
	la $a0, senha
	syscall
	
	# Armazenar a senha digitada pelo usuario
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Faz a comparação bit wise usando XOR
	xor $t2, $t0, $t1
	
	# Se XOR resultar em 0, significa que os números são idênticos bit a bit
	beqz $t2, eh_igual
	
	# Se não retornou é porque são diferentes
	j diferente

eh_igual:
	# Printa 'As senhas são iguais!'
	li $v0, 4
	la $a0, iguais
	syscall
	
	# Pula para a label sair
	j sair
	
diferente: 
	# Printa 'As senhas são diferentes!'
	li $v0, 4
	la $a0, diferentes
	syscall
	
	# Pula para a label sair
	j sair

sair: 
	# Sai do programa
	li $v0, 10
	syscall	
	