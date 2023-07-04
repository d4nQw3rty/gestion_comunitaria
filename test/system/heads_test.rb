require "application_system_test_case"

class HeadsTest < ApplicationSystemTestCase
  setup do
    @head = heads(:one)
  end

  test "visiting the index" do
    visit heads_url
    assert_selector "h1", text: "Heads"
  end

  test "should create head" do
    visit heads_url
    click_on "New head"

    fill_in "Birthdate", with: @head.birthdate
    fill_in "Cedula", with: @head.cedula
    fill_in "Name", with: @head.name
    fill_in "Sur name", with: @head.sur_name
    fill_in "User", with: @head.user_id
    click_on "Create Head"

    assert_text "Head was successfully created"
    click_on "Back"
  end

  test "should update Head" do
    visit head_url(@head)
    click_on "Edit this head", match: :first

    fill_in "Birthdate", with: @head.birthdate
    fill_in "Cedula", with: @head.cedula
    fill_in "Name", with: @head.name
    fill_in "Sur name", with: @head.sur_name
    fill_in "User", with: @head.user_id
    click_on "Update Head"

    assert_text "Head was successfully updated"
    click_on "Back"
  end

  test "should destroy Head" do
    visit head_url(@head)
    click_on "Destroy this head", match: :first

    assert_text "Head was successfully destroyed"
  end
end
