require 'test_helper'

class HomePageControllerTest < ActionController::TestCase
  test "should get HomePage" do
    get :HomePage
    assert_response :success
  end

end
