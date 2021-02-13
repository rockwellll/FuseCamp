require "test_helper"

class PeoplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get peoples_index_url
    assert_response :success
  end
end
