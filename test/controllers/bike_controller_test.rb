require 'test_helper'

class BikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bike_index_url
    assert_response :success
  end

end
