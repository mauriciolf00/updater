#!/bin/bash

#INSTALAÇÃO
    #Na instalação/primeira execução do script será buscado o caminho do shell padrão para substituir #!/bin/bash, conforme orientado pelo manual do sh.
    #Checar dependências: APT
    #Criar arquivos de log

#EXECUÇÃO
    #Na execução básica do script sera executado o comando "apt-get update" e a checagem de upgrades disponíveis. Em seguida será informado quantos upgrades estão disponíveis, e se forem mais de 0 será solicitado se o usuário deseja executar dist-upgrade.
    #Alternativamente serão configurados parâmetros para uma única execução completa.

#PARÂMETROS
    #--help: Será listado todos os parâmetros.
    #-ug: Será executado um "apt upgrade -y"
    #-dug: Será executado um "dist-upgrade -y"
    #-l: Será apenas listado os upgrades disponíveis

update_log=/var/log/updates.log

#########################################################
# DECLARAÇÃO DE FUNÇÕES
#########################################################

#checar se arquivo de log existe. Senão, criar.
check_log_files(){
    if [ ! -f $update_log ]
    then
        touch $update_log
    fi

    if [ ! -f $update_output ]
    then
        touch $update_output
    fi
}

#checar se houve erro na execução
check_exit(){
    if [ $? -ne 0 ]
    then
        echo "ERROR:$? Check /var/log/updates.log for more information."
    else
        echo "Done. Logs can be found in /var/log/updates.log"
    fi
}

#prompt básico de erro
std_error(){
    echo "ERROR:$?. Run update -h for a list of exit codes."
}

#output de data para log
data(){
    echo "_____ $(date) _____"
}

#função de update
update(){
    echo "UPDATE RUN: $(data)"
    apt-get update 2>&1
    update_exit=$?
    echo "EXIT CODE: $update_exit"
    apt list --upgradable 2>/dev/null
    upgradable_exit=$?
    echo "EXIT CODE: $upgradable_exit"
}

#função de upgrade
upgrade(){
    data
    echo "UPGRADING..."
    apt-get upgrade -y
}

#########################################################
#EXECUÇÃO
#########################################################

#Ver uma forma de exibir um echo "UPDATING... Done". enquanto a função está em execução.
echo "UPDATING..."
update > $update_log
check_exit


#########################################################
#EXIT CODES:
#########################################################

#100+: erro no apt-get update