#!/bin/bash

#INSTALAÇÃO
    #Na instalação/primeira execução do script será buscado o caminho do shell padrão para substituir #!/bin/bash, conforme orientado pelo manual do sh.
    #Checar dependências: APT
    #Criar arquivos de log

#EXECUÇÃO
    #Na execução básica do script sera executado o comando "apt update" e a checagem de upgrades disponíveis. Em seguida será informado quantos upgrades estão disponíveis, e se forem mais de 0 será solicitado se o usuário deseja executar dist-upgrade.
    #Alternativamente serão configurados parâmetros para uma única execução completa.

#PARÂMETROS
    #--help: Será listado todos os parâmetros.
    #-ug: Será executado um "apt upgrade -y"
    #-dug: Será executado um "dist-upgrade -y"
    #-l: Será apenas listado os upgrades disponíveis

update_log=/var/log/updates.log

# DECLARAÇÃO DE FUNÇÕES

check_exit(){
    if [ $? -ne 0 ]
    then
        echo "ERROR:$? Check /var/log/updates.log for more information."
    else
        echo "Done. Logs can be found in /var/log/updates.log"
    fi
}

data(){
    echo "_____________________________"
    date
    echo "_____________________________"
}

update(){
    echo "UPDATE RUN:"
    data
    #Redirecionar erros
    apt-get update
    apt list --upgradable 2>/dev/null
}

upgrade(){
    echo "UPGRADING..."
    data
    apt upgrade -y 
}

#EXECUÇÃO

#Ver uma forma de exibir um echo "UPDATING... Done". enquanto a função está em execução.
echo "UPDATING..."
update > $update_log
check_exit

