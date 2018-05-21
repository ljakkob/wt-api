Dado("que o convênio está autenticado:") do |table|
  @user = table.rows_hash
  HTTParty.get("http://10.1.72.25:8888/wextravel/api/cartaovirtual/#{@user['convenio']}/#{@user['password']}/getToken")
  end
  
  Dado("que o analista forneceu as seguintes informações") do |table|
  @user = table.rows_hash
  end
  
  Quando("eu faço uma solicitação POST para o serviço listCartoes") do
    @result = HTTParty.post( 
        "http://10.1.72.25:8888/wextravel/api/cartaovirtual/listCartoes",
        headers: { 'Content-Type' => 'application/json' },
        body: @user.to_json)
    end
  
    Então("o código de resposta HTTP deve ser igual a {string}") do |status_code|
        expect(@result.response.code).to eql status_code
      end
      
  
  Então("no corpo da resposta do ver uma mensagem {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  




































  