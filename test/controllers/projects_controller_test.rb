require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @account = accounts :one
    @project = @account.projects.first
  end

  test 'when getting the root path youll be redirected to the projects path of a user' do
    sign_in users(:one)
    get root_path
    assert_redirected_to account_projects_path account_id: @account
  end

  test "should get new form for creating a new project" do
    sign_in users :one
    get new_account_project_path account_id: @account
  end

  test "creating a new project will redirect back to the projects page" do
    sign_in users :one
    new_project = {
        name: "new project",
        description: "some random description"
    }
    assert_difference('Project.count') do
      post account_projects_path account_id: @account, params: { project: new_project }
    end

    assert_redirected_to account_projects_path account_id: @account
  end

  test "updating projects will redirect to the project index path" do
    sign_in users(:one)
    patch account_project_path account_id: @account, id: @project, params: { project: {name: "updated"} }

    @project.reload

    assert_redirected_to account_projects_path account_id: @account
    assert_equal @project.name, "updated"
  end

  test "deleting a project will redirect to projects index path" do
    sign_in users(:one)
    assert_difference 'Project.count', -1 do
      delete account_project_path account_id: @account, id: @project
    end

    assert_redirected_to account_projects_path account_id: @account
  end
end
