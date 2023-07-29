require "application_system_test_case"

class SocialAidsTest < ApplicationSystemTestCase
  setup do
    @social_aid = social_aids(:one)
  end

  test "visiting the index" do
    visit social_aids_url
    assert_selector "h1", text: "Social aids"
  end

  test "should create social aid" do
    visit social_aids_url
    click_on "New social aid"

    fill_in "Description", with: @social_aid.description
    fill_in "Name", with: @social_aid.name
    click_on "Create Social aid"

    assert_text "Social aid was successfully created"
    click_on "Back"
  end

  test "should update Social aid" do
    visit social_aid_url(@social_aid)
    click_on "Edit this social aid", match: :first

    fill_in "Description", with: @social_aid.description
    fill_in "Name", with: @social_aid.name
    click_on "Update Social aid"

    assert_text "Social aid was successfully updated"
    click_on "Back"
  end

  test "should destroy Social aid" do
    visit social_aid_url(@social_aid)
    click_on "Destroy this social aid", match: :first

    assert_text "Social aid was successfully destroyed"
  end
end
