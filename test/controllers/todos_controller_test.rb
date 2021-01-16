require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users :one
    @project = projects :one
    @todo_set = todo_sets :one
    @todo = todos :one
  end

  test 'deleting a todo should put in trash and perform a soft deletion' do
    sign_in @user
    delete user_project_todo_set_todo_path user_id: @user, project_id: @project, todo_list_id: @todo_set, id: @todo

    @todo.reload

    assert_not_nil @todo.deleted_at
    assert_not_empty @project.trash.items
  end

  test 'updating a todo will only change the todo status' do
    sign_in @user
    old_status = @todo.status

    patch user_project_todo_set_todo_path user_id: @user, project_id: @project, todo_list_id: @todo_set, id: @todo

    @todo.reload
    assert_not_equal @todo.status, old_status
  end

end
