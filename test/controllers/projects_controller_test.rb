require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get projects_new_url
    assert_response :success
  end

  test "should get store" do
    get projects_store_url
    assert_response :success
  end

end
