require "application_system_test_case"

class EscalasTest < ApplicationSystemTestCase
  setup do
    @escala = escalas(:one)
  end

  test "visiting the index" do
    visit escalas_url
    assert_selector "h1", text: "Escalas"
  end

  test "should create escala" do
    visit escalas_url
    click_on "New escala"

    click_on "Create Escala"

    assert_text "Escala was successfully created"
    click_on "Back"
  end

  test "should update Escala" do
    visit escala_url(@escala)
    click_on "Edit this escala", match: :first

    click_on "Update Escala"

    assert_text "Escala was successfully updated"
    click_on "Back"
  end

  test "should destroy Escala" do
    visit escala_url(@escala)
    click_on "Destroy this escala", match: :first

    assert_text "Escala was successfully destroyed"
  end
end
