require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @todo_set = todo_lists :one
    @user = users :one
    @project = projects :one
  end

  test 'should show index for a project' do
    sign_in @user

    get user_project_todo_sets_path user_id: @user, project_id: @project
    assert_response :success
  end

  test "should be able to create new todo lists" do
    sign_in @user
    assert_difference 'TodoSet.count' do
      post user_project_todo_sets_path user_id: @user, project_id: @project, params: {todo_set: {name: "some random name"}}
    end


    assert_redirected_to user_project_todo_sets_path user_id: @user, project_id: @project, id: TodoSet.last
  end

  test "should be able to destroy a todo list" do
    sign_in @user

    assert_difference 'TodoSet.count', -1 do
      delete user_project_todo_set_path user_id: @user, project_id: @project, id: @todo_set
    end

    assert_redirected_to user_project_todo_sets_path user_id: @user, project_id: @project
  end

  test 'should update a todo list' do
    post user_project_todo_set_path user_id: @user, project_id: @project, id: @todo_set, params: {todo_set: {name: "updated name"}}
    @todo_set.reload

    assert_equal 'updated name', @todo_set.name
  end
end
