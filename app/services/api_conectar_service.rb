#require "uri"
#require "net/http"

class ApiConectarService
  def initialize(params={})
    @url = (params[:url])
    @usuario = (params[:usuario])
    @senha = (params[:senha])
  end

  def conectar
    conectar_api
  end

  private

  def conectar_api
    ender = @url + '/api/login'
    url = URI("#{ender}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    #request["X-API-Key"] = @apikey
    request["usuario"] = @usuario
    request["senha"] = @senha
    request["Cookie"] = "SERVERID=WS4CH"

    response = https.request(request)
    response.read_body

  end
end