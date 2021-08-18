require "application_system_test_case"

class CheckItemsTest < ApplicationSystemTestCase
  setup do
    @check_item = check_items(:one)
  end

  test "visiting the index" do
    visit check_items_url
    assert_selector "h1", text: "Check Items"
  end

  test "creating a Check item" do
    visit check_items_url
    click_on "New Check Item"

    fill_in "Favorite", with: @check_item.favorite_id
    fill_in "Product", with: @check_item.product_id
    click_on "Create Check item"

    assert_text "Check item was successfully created"
    click_on "Back"
  end

  test "updating a Check item" do
    visit check_items_url
    click_on "Edit", match: :first

    fill_in "Favorite", with: @check_item.favorite_id
    fill_in "Product", with: @check_item.product_id
    click_on "Update Check item"

    assert_text "Check item was successfully updated"
    click_on "Back"
  end

  test "destroying a Check item" do
    visit check_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Check item was successfully destroyed"
  end
end
