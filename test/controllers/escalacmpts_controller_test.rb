require "test_helper"

class EscalacmptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escalacmpt = escalacmpts(:one)
  end

  test "should get index" do
    get escalacmpts_url
    assert_response :success
  end

  test "should get new" do
    get new_escalacmpt_url
    assert_response :success
  end

  test "should create escalacmpt" do
    assert_difference("Escalacmpt.count") do
      post escalacmpts_url, params: { escalacmpt: { cmpt: @escalacmpt.cmpt, equipe_id: @escalacmpt.equipe_id } }
    end

    assert_redirected_to escalacmpt_url(Escalacmpt.last)
  end

  test "should show escalacmpt" do
    get escalacmpt_url(@escalacmpt)
    assert_response :success
  end

  test "should get edit" do
    get edit_escalacmpt_url(@escalacmpt)
    assert_response :success
  end

  test "should update escalacmpt" do
    patch escalacmpt_url(@escalacmpt), params: { escalacmpt: { cmpt: @escalacmpt.cmpt, equipe_id: @escalacmpt.equipe_id } }
    assert_redirected_to escalacmpt_url(@escalacmpt)
  end

  test "should destroy escalacmpt" do
    assert_difference("Escalacmpt.count", -1) do
      delete escalacmpt_url(@escalacmpt)
    end

    assert_redirected_to escalacmpts_url
  end
end
