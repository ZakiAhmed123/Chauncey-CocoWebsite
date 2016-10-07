require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get shipping" do
    get :shipping
    assert_response :success
  end

  test "should get process_shipping" do
    get :process_shipping
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

  test "should get process_payment" do
    get :process_payment
    assert_response :success
  end

  test "should get receipt" do
    get :receipt
    assert_response :success
  end

end
