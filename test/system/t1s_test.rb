require "application_system_test_case"

class T1sTest < ApplicationSystemTestCase
  setup do
    @t1 = t1s(:one)
  end

  test "visiting the index" do
    visit t1s_url
    assert_selector "h1", text: "T1s"
  end

  test "creating a T1" do
    visit t1s_url
    click_on "New T1"

    click_on "Create T1"

    assert_text "T1 was successfully created"
    click_on "Back"
  end

  test "updating a T1" do
    visit t1s_url
    click_on "Edit", match: :first

    click_on "Update T1"

    assert_text "T1 was successfully updated"
    click_on "Back"
  end

  test "destroying a T1" do
    visit t1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "T1 was successfully destroyed"
  end
end
