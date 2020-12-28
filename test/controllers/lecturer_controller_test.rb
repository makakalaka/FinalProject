require 'test_helper'

class LecturerControllerTest < ActionDispatch::IntegrationTest
  test "should get lect_page" do
    get lecturer_lect_page_url
    assert_response :success
  end

end
