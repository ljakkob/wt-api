#language: pt
Funcionalidade: Listar Cartões
    Sendo uma aplicação web  
    Posso solicitar requisições POST para o serviço listCartoes
    Para listar os cartões de um convênio específico

       Contexto: Convenio autenticado
        Dado que o convênio está autenticado:
            | convenio | 36784    |
            | password | wex1234  |
        
        @list
        Cenário: Listar cartões
        Dado que o analista forneceu as seguintes informações
        |codigoConvenio| 36784    |
        |dtInicial     |01/05/2018|
        |dtFinal       |01/05/2018|
   
        Quando eu faço uma solicitação POST para o serviço listCartoes
        Então o código de resposta HTTP deve ser igual a "200" 
        E no corpo da resposta do ver uma mensagem "<message>"