require "test_helper"

class MessageboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messageboards_index_url
    assert_response :success
  end
end
