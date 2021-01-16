require 'test_helper'

class TodoSetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @todo_set = todo_sets :one
    @user = users :one
    @project = projects :one
    sign_in @user
  end

  test 'should show index for a project' do
    get user_project_todo_sets_path user_id: @user, project_id: @project
    assert_response :success
  end

  test "should be able to create new todo lists" do
    sign_in @user
    assert_difference 'TodoSet.count' do
      post user_project_todo_sets_path user_id: @user, project_id: @project, params: {todo_set: {name: "some random name"}}
    end


    assert_redirected_to user_project_todo_set_path user_id: @user, project_id: @project, id: TodoSet.last
  end

  test "should be able to destroy a todo list" do
    sign_in @user

    assert_difference 'TodoSet.count', -1 do
      delete user_project_todo_set_path user_id: @user, project_id: @project, id: @todo_set
    end

    assert_redirected_to user_project_todo_sets_path user_id: @user, project_id: @project
  end
end
