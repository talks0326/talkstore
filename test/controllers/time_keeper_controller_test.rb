require 'test_helper'

class TimeKeeperControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get time_keeper_show_url
    assert_response :success
  end

end
