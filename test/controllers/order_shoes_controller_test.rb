require "test_helper"

class OrderShoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_shoe = order_shoes(:one)
  end

  test "should get index" do
    get order_shoes_url
    assert_response :success
  end

  test "should get new" do
    get new_order_shoe_url
    assert_response :success
  end

  test "should create order_shoe" do
    assert_difference("OrderShoe.count") do
      post order_shoes_url, params: { order_shoe: { active: @order_shoe.active, discount: @order_shoe.discount, order_id: @order_shoe.order_id, price: @order_shoe.price, shoe_id: @order_shoe.shoe_id } }
    end

    assert_redirected_to order_shoe_url(OrderShoe.last)
  end

  test "should show order_shoe" do
    get order_shoe_url(@order_shoe)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_shoe_url(@order_shoe)
    assert_response :success
  end

  test "should update order_shoe" do
    patch order_shoe_url(@order_shoe), params: { order_shoe: { active: @order_shoe.active, discount: @order_shoe.discount, order_id: @order_shoe.order_id, price: @order_shoe.price, shoe_id: @order_shoe.shoe_id } }
    assert_redirected_to order_shoe_url(@order_shoe)
  end

  test "should destroy order_shoe" do
    assert_difference("OrderShoe.count", -1) do
      delete order_shoe_url(@order_shoe)
    end

    assert_redirected_to order_shoes_url
  end
end
