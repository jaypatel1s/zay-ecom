require "application_system_test_case"

class OrderShoesTest < ApplicationSystemTestCase
  setup do
    @order_shoe = order_shoes(:one)
  end

  test "visiting the index" do
    visit order_shoes_url
    assert_selector "h1", text: "Order shoes"
  end

  test "should create order shoe" do
    visit order_shoes_url
    click_on "New order shoe"

    check "Active" if @order_shoe.active
    fill_in "Discount", with: @order_shoe.discount
    fill_in "Order", with: @order_shoe.order_id
    fill_in "Price", with: @order_shoe.price
    fill_in "Shoe", with: @order_shoe.shoe_id
    click_on "Create Order shoe"

    assert_text "Order shoe was successfully created"
    click_on "Back"
  end

  test "should update Order shoe" do
    visit order_shoe_url(@order_shoe)
    click_on "Edit this order shoe", match: :first

    check "Active" if @order_shoe.active
    fill_in "Discount", with: @order_shoe.discount
    fill_in "Order", with: @order_shoe.order_id
    fill_in "Price", with: @order_shoe.price
    fill_in "Shoe", with: @order_shoe.shoe_id
    click_on "Update Order shoe"

    assert_text "Order shoe was successfully updated"
    click_on "Back"
  end

  test "should destroy Order shoe" do
    visit order_shoe_url(@order_shoe)
    click_on "Destroy this order shoe", match: :first

    assert_text "Order shoe was successfully destroyed"
  end
end
