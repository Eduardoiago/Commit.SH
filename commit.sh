#!/bin/bash

# Script name:         COMMIT.SH
# Author:              Eduardo iago
# Shell script para otimizar os commits dos projetos, usando o script
# automaticamente você usa o `git add .`, `git commit -m` e `git push -u origin main`.

USAGE() { # Função para exibir mensagens de uso
	echo
	echo "     _____                           _ _         _     "
	echo "    /  __ \                         (_) |       | |    "
	echo "    | /  \/ ___  _ __ ___  _ __ ___  _| |_   ___| |__  "
	echo "    | |    / _ \| '_   _ \| '_   _ \| | __| / __|  _ \ "
	echo "    | \__/\ (_) | | | | | | | | | | | | |_ _\__ \ | | |"
	echo "     \____/\___/|_| |_| |_|_| |_| |_|_|\__(_)___/_| |_|"
	echo "                                 Create by Eduardo Iago"
	echo
	echo "         The script adds the modified files using"
	echo "       git add . , adds your message to the command"
	echo "        git commit -m (your commit) and pushes it."
	echo
	echo "             Usage: ./commit.sh [-m] [message]"
	echo
	echo "      Options:"
	echo
	echo "   -m | --message       Add the changes, add commit and push"
	echo "   -h | --help          Usage message"
}

# Verificar se nenhum argumento foi usado
if [ $# -eq 0 ]; then
	echo "[-] Error: No parameters supplied."
    	USAGE
    	exit 1
fi

# Processando os parâmetros
while [[ "$#" -gt 0 ]]; do
    	case $1 in
        	-m|--message)
            		if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
                		MESSAGE="$2"
                		shift
            		else
                		echo "[-] Error: The -m | --message parameter requires an argument"
                		exit 1
            		fi
            		;;
        	-h|--help)
            		USAGE
            		exit 0
            		;;
        	*)
            		echo "invalid parameter: $1"
            		USAGE
            		exit 1
            		;;
    	esac
    	shift
done

# Executa as operações do Git se a mensagem foi fornecida pelo usuário
if [ -n "$MESSAGE" ]; then
    	echo
    	git add .
	echo -e "\033[1;33m [*] Adding the changes to the local repository! \033[0m"
	echo
    	git commit -m "$MESSAGE"
	echo
	echo -e "\033[1;33m [*] Adding the commit! \033[0m"
	echo
	# Caso o usuário esteja fazendo commit em outra branch, deve alterar a linha de comando para o nome da branch
    	git push -u origin main
	echo
	echo -e "\033[1;34m [+] The push was completed successfully! \033[0m"
else
    	echo "[-] Error: The commit message is required with the -m | --message parameter"
    	USAGE
    	exit 1
fi
