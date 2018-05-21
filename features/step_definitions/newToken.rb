Dado("que o analista informou os seguintes dados:") do |table|
    @user = table.rows_hash
    #HTTparty.get("http://marktasks.herokuapp.com/api/reset/#{@user['email']}?clean=full")
  HTTParty.get("http://10.1.72.25:8888/wextravel/api/cartaovirtual/#{@user['convenio']}/#{@user['password']}/getToken")
  end
  
  Quando("faço uma solicitação GET para o serviço getToken") do
    @result = HTTParty.get("http://10.1.72.25:8888/wextravel/api/cartaovirtual/#{@user['convenio']}/#{@user['password']}/getToken")
  end
  
  Então("O código de resposta HTTP deve ser igual a {string}") do |status_code|
    expect(@result.response.code).to eql status_code
  end
  
  E("O código da mensagem de retorno deve ser igual a {string}") do |codigoRetorno|
    expect(@result.parsed_response).to have_key('codigoRetorno')
    expect(@result.parsed_response['codigoRetorno']).to eql "0"
  end
  
  E("no corpo da resposta ver uma mensagem {string}") do |mensagemRetorno|
    expect(@result.parsed_response).to have_key('mensagemRetorno')
    expect(@result.parsed_response['mensagemRetorno']).to eql "OPERACAO REALIZADA COM SUCESSO"
    puts @result.parsed_response['token']
  end
  