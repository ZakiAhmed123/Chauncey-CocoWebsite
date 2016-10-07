require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get add_to_cart" do
    get :add_to_cart
    assert_response :success
  end

  test "should get remove_from_cart" do
    get :remove_from_cart
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
