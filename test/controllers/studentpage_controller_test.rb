require 'test_helper'

class StudentpageControllerTest < ActionDispatch::IntegrationTest
  test "should get student_page" do
    get studentpage_student_page_url
    assert_response :success
  end

end
