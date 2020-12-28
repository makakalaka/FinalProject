require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get groups_display" do
    get admin_groups_display_url
    assert_response :success
  end

end
