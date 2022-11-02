json.extract! estabelecimento, :id, :nome, :cnpj, :cnes, :endereco, :end_numero, :bairro, :cidade, :uf, :cep, :api_url, :api_usuario, :api_senha, :created_at, :updated_at
json.url estabelecimento_url(estabelecimento, format: :json)
