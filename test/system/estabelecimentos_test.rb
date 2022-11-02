require "application_system_test_case"

class EstabelecimentosTest < ApplicationSystemTestCase
  setup do
    @estabelecimento = estabelecimentos(:one)
  end

  test "visiting the index" do
    visit estabelecimentos_url
    assert_selector "h1", text: "Estabelecimentos"
  end

  test "should create estabelecimento" do
    visit estabelecimentos_url
    click_on "New estabelecimento"

    fill_in "Api senha", with: @estabelecimento.api_senha
    fill_in "Api url", with: @estabelecimento.api_url
    fill_in "Api usuario", with: @estabelecimento.api_usuario
    fill_in "Bairro", with: @estabelecimento.bairro
    fill_in "Cep", with: @estabelecimento.cep
    fill_in "Cidade", with: @estabelecimento.cidade
    fill_in "Cnes", with: @estabelecimento.cnes
    fill_in "Cnpj", with: @estabelecimento.cnpj
    fill_in "End numero", with: @estabelecimento.end_numero
    fill_in "Endereco", with: @estabelecimento.endereco
    fill_in "Nome", with: @estabelecimento.nome
    fill_in "Uf", with: @estabelecimento.uf
    click_on "Create Estabelecimento"

    assert_text "Estabelecimento was successfully created"
    click_on "Back"
  end

  test "should update Estabelecimento" do
    visit estabelecimento_url(@estabelecimento)
    click_on "Edit this estabelecimento", match: :first

    fill_in "Api senha", with: @estabelecimento.api_senha
    fill_in "Api url", with: @estabelecimento.api_url
    fill_in "Api usuario", with: @estabelecimento.api_usuario
    fill_in "Bairro", with: @estabelecimento.bairro
    fill_in "Cep", with: @estabelecimento.cep
    fill_in "Cidade", with: @estabelecimento.cidade
    fill_in "Cnes", with: @estabelecimento.cnes
    fill_in "Cnpj", with: @estabelecimento.cnpj
    fill_in "End numero", with: @estabelecimento.end_numero
    fill_in "Endereco", with: @estabelecimento.endereco
    fill_in "Nome", with: @estabelecimento.nome
    fill_in "Uf", with: @estabelecimento.uf
    click_on "Update Estabelecimento"

    assert_text "Estabelecimento was successfully updated"
    click_on "Back"
  end

  test "should destroy Estabelecimento" do
    visit estabelecimento_url(@estabelecimento)
    click_on "Destroy this estabelecimento", match: :first

    assert_text "Estabelecimento was successfully destroyed"
  end
end
