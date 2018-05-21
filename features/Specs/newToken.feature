#language: pt
Funcionalidade: Gerar Token
    Sendo uma aplicação web cliente 
    Posso solicitar requisições GET para o serviço getToken
    Para registrar um convênio no sistema

    @newtoken
    Cenario: Autenticação
        Dado que o analista informou os seguintes dados:
            | convenio | 36784    |
            | password | wex1234  |
       
        Quando faço uma solicitação GET para o serviço getToken
        Então O código de resposta HTTP deve ser igual a "200"
        Então O código da mensagem de retorno deve ser igual a "<codigoRetorno>"
        Então no corpo da resposta ver uma mensagem "<mensagemRetorno>"