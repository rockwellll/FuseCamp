require 'test_helper'

class TodoGroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @user = users :one
    sign_in @user
    @todo_set = todo_sets :one
    @project = projects :one
  end

  test 'it creates a todo group for a todo set' do
    assert_difference 'TodoSet.count' do
      post todo_set_todo_groups_path todo_set_id: @todo_set, params: { todo_set: {name: "New todo group"}, color: 'red'}
    end

    assert_not_nil @todo_set.todo_groups.last.parent_id
    assert_redirected_to user_project_todo_set_path user_id: @user, project_id: @project, id: @todo_set
  end

  test 'it will create a todo set based on a todo set and redirect to the todos page' do
    assert_difference 'TodoSet.groups.count', -1 do
      delete todo_set_promote_path todo_set_id: todo_sets(:three), params: { todo_set: {name: "New todo group"}, color: 'red'}
    end
  end
end
