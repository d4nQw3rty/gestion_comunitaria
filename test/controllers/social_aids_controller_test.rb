require "test_helper"

class SocialAidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_aid = social_aids(:one)
  end

  test "should get index" do
    get social_aids_url
    assert_response :success
  end

  test "should get new" do
    get new_social_aid_url
    assert_response :success
  end

  test "should create social_aid" do
    assert_difference("SocialAid.count") do
      post social_aids_url, params: { social_aid: { description: @social_aid.description, name: @social_aid.name } }
    end

    assert_redirected_to social_aid_url(SocialAid.last)
  end

  test "should show social_aid" do
    get social_aid_url(@social_aid)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_aid_url(@social_aid)
    assert_response :success
  end

  test "should update social_aid" do
    patch social_aid_url(@social_aid), params: { social_aid: { description: @social_aid.description, name: @social_aid.name } }
    assert_redirected_to social_aid_url(@social_aid)
  end

  test "should destroy social_aid" do
    assert_difference("SocialAid.count", -1) do
      delete social_aid_url(@social_aid)
    end

    assert_redirected_to social_aids_url
  end
end
