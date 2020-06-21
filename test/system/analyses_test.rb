require "application_system_test_case"

class AnalysesTest < ApplicationSystemTestCase
  setup do
    @analysis = analyses(:one)
  end

  test "visiting the index" do
    visit analyses_url
    assert_selector "h1", text: "Analyses"
  end

  test "creating a Analysis" do
    visit analyses_url
    click_on "New Analysis"

    fill_in "Num1", with: @analysis.num1
    fill_in "Num2", with: @analysis.num2
    fill_in "User", with: @analysis.user_id
    click_on "Create Analysis"

    assert_text "Analysis was successfully created"
    click_on "Back"
  end

  test "updating a Analysis" do
    visit analyses_url
    click_on "Edit", match: :first

    fill_in "Num1", with: @analysis.num1
    fill_in "Num2", with: @analysis.num2
    fill_in "User", with: @analysis.user_id
    click_on "Update Analysis"

    assert_text "Analysis was successfully updated"
    click_on "Back"
  end

  test "destroying a Analysis" do
    visit analyses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Analysis was successfully destroyed"
  end
end
