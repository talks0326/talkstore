require 'test_helper'

class ApplyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apply_index_url
    assert_response :success
  end

  test "should get show" do
    get apply_show_url
    assert_response :success
  end

  test "should get choose" do
    get apply_choose_url
    assert_response :success
  end

end
