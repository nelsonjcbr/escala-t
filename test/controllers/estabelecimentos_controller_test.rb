require "test_helper"

class EstabelecimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estabelecimento = estabelecimentos(:one)
  end

  test "should get index" do
    get estabelecimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_estabelecimento_url
    assert_response :success
  end

  test "should create estabelecimento" do
    assert_difference("Estabelecimento.count") do
      post estabelecimentos_url, params: { estabelecimento: { api_senha: @estabelecimento.api_senha, api_url: @estabelecimento.api_url, api_usuario: @estabelecimento.api_usuario, bairro: @estabelecimento.bairro, cep: @estabelecimento.cep, cidade: @estabelecimento.cidade, cnes: @estabelecimento.cnes, cnpj: @estabelecimento.cnpj, end_numero: @estabelecimento.end_numero, endereco: @estabelecimento.endereco, nome: @estabelecimento.nome, uf: @estabelecimento.uf } }
    end

    assert_redirected_to estabelecimento_url(Estabelecimento.last)
  end

  test "should show estabelecimento" do
    get estabelecimento_url(@estabelecimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_estabelecimento_url(@estabelecimento)
    assert_response :success
  end

  test "should update estabelecimento" do
    patch estabelecimento_url(@estabelecimento), params: { estabelecimento: { api_senha: @estabelecimento.api_senha, api_url: @estabelecimento.api_url, api_usuario: @estabelecimento.api_usuario, bairro: @estabelecimento.bairro, cep: @estabelecimento.cep, cidade: @estabelecimento.cidade, cnes: @estabelecimento.cnes, cnpj: @estabelecimento.cnpj, end_numero: @estabelecimento.end_numero, endereco: @estabelecimento.endereco, nome: @estabelecimento.nome, uf: @estabelecimento.uf } }
    assert_redirected_to estabelecimento_url(@estabelecimento)
  end

  test "should destroy estabelecimento" do
    assert_difference("Estabelecimento.count", -1) do
      delete estabelecimento_url(@estabelecimento)
    end

    assert_redirected_to estabelecimentos_url
  end
end
