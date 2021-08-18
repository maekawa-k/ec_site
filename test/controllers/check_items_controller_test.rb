require 'test_helper'

class CheckItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_item = check_items(:one)
  end

  test "should get index" do
    get check_items_url
    assert_response :success
  end

  test "should get new" do
    get new_check_item_url
    assert_response :success
  end

  test "should create check_item" do
    assert_difference('CheckItem.count') do
      post check_items_url, params: { check_item: { favorite_id: @check_item.favorite_id, product_id: @check_item.product_id } }
    end

    assert_redirected_to check_item_url(CheckItem.last)
  end

  test "should show check_item" do
    get check_item_url(@check_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_item_url(@check_item)
    assert_response :success
  end

  test "should update check_item" do
    patch check_item_url(@check_item), params: { check_item: { favorite_id: @check_item.favorite_id, product_id: @check_item.product_id } }
    assert_redirected_to check_item_url(@check_item)
  end

  test "should destroy check_item" do
    assert_difference('CheckItem.count', -1) do
      delete check_item_url(@check_item)
    end

    assert_redirected_to check_items_url
  end
end
