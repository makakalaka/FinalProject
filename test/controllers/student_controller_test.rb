require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get student_news_url
    assert_response :success
  end

end
