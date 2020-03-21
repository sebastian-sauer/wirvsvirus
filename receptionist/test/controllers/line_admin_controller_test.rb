require 'test_helper'

class LineAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_admin_index_url
    assert_response :success
  end

end
