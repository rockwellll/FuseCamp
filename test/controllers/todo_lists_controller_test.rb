require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @todo_list = todo_lists :one
    @user = users :one
    @project = projects :one
  end

  test 'should show index for a project' do
    sign_in @user

    get user_project_todo_lists_path user_id: @user, project_id: @project
    assert_response :success
  end

  test "should be able to create new todo lists" do
    sign_in @user
    assert_difference 'TodoList.count' do
      post user_project_todo_lists_path user_id: @user, project_id: @project, params: {todo_list: {name: "some random name"}}
    end


    assert_redirected_to user_project_todo_list_path user_id: @user, project_id: @project, id: TodoList.last
  end

  test "should be able to destroy a todo list" do
    sign_in @user

    assert_difference 'TodoList.count', -1 do
      delete user_project_todo_list_path user_id: @user, project_id: @project, id: @todo_list
    end

    assert_redirected_to user_project_todo_lists_path user_id: @user, project_id: @project
  end

  test 'should update a todo list' do
    post user_project_todo_list_path user_id: @user, project_id: @project, id: @todo_list, params: {todo_list: {name: "updated name"}}
    @todo_list.reload

    assert_equal 'updated name', @todo_list.name
  end
end
