require "application_system_test_case"

class EscalacmptsTest < ApplicationSystemTestCase
  setup do
    @escalacmpt = escalacmpts(:one)
  end

  test "visiting the index" do
    visit escalacmpts_url
    assert_selector "h1", text: "Escalacmpts"
  end

  test "should create escalacmpt" do
    visit escalacmpts_url
    click_on "New escalacmpt"

    fill_in "Cmpt", with: @escalacmpt.cmpt
    fill_in "Equipe", with: @escalacmpt.equipe_id
    click_on "Create Escalacmpt"

    assert_text "Escalacmpt was successfully created"
    click_on "Back"
  end

  test "should update Escalacmpt" do
    visit escalacmpt_url(@escalacmpt)
    click_on "Edit this escalacmpt", match: :first

    fill_in "Cmpt", with: @escalacmpt.cmpt
    fill_in "Equipe", with: @escalacmpt.equipe_id
    click_on "Update Escalacmpt"

    assert_text "Escalacmpt was successfully updated"
    click_on "Back"
  end

  test "should destroy Escalacmpt" do
    visit escalacmpt_url(@escalacmpt)
    click_on "Destroy this escalacmpt", match: :first

    assert_text "Escalacmpt was successfully destroyed"
  end
end
