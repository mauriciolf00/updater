#!/bin/bash

#INSTALAÇÃO
    #Na instalação/primeira execução do script será buscado o caminho do shell padrão para substituir #!/bin/bash, conforme orientado pelo manual do sh.

#EXECUÇÃO
    #Na execução básica do script sera executado o comando "apt update" e a checagem de upgrades disponíveis. Em seguida será informado quantos upgrades estão disponíveis, e se forem mais de 0 será solicitado se o usuário deseja executar dist-upgrade.
    #Alternativamente serão configurados parâmetros para uma única execução completa.

#PARÂMETROS
    #--help: Será listado todos os parâmetros.
    #-ug: Será executado um "apt upgrade -y"
    #-dug: Será executado um "dist-upgrade -y"
    #-l: Será apenas listado os upgrades disponíveis


