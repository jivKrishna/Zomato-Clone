require 'test_helper'

class RestaurantCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get restaurant_categories_new_url
    assert_response :success
  end

end
