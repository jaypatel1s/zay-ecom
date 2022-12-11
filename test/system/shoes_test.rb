require "application_system_test_case"

class ShoesTest < ApplicationSystemTestCase
  setup do
    @shoe = shoes(:one)
  end

  test "visiting the index" do
    visit shoes_url
    assert_selector "h1", text: "Shoes"
  end

  test "should create shoe" do
    visit shoes_url
    click_on "New shoe"

    click_on "Create Shoe"

    assert_text "Shoe was successfully created"
    click_on "Back"
  end

  test "should update Shoe" do
    visit shoe_url(@shoe)
    click_on "Edit this shoe", match: :first

    click_on "Update Shoe"

    assert_text "Shoe was successfully updated"
    click_on "Back"
  end

  test "should destroy Shoe" do
    visit shoe_url(@shoe)
    click_on "Destroy this shoe", match: :first

    assert_text "Shoe was successfully destroyed"
  end
end
