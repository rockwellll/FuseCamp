require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users :one
    @project = @user.projects.first
  end

  test 'when getting the root path youll be redirected to the projects path of a user' do
    sign_in users(:one)
    get root_path
    assert_redirected_to user_projects_path user_id: users(:one)
  end

  test "should get new form for creating a new project" do
    sign_in users :one
    get new_user_project_path user_id: users(:one)
  end

  test "creating a new project will redirect back to the projects page" do
    sign_in users :one
    new_project = {
        name: "new project",
        description: "some random description"
    }


    assert_difference('Project.count') do
      post user_projects_path user_id: users(:one), params: { project: new_project }
    end

    assert_redirected_to user_projects_path user_id: users(:one)
  end

  test "updating projects will redirect to the project index path" do
    project = @project
    patch user_project_path user_id: @user, id: project, params: { project: {name: "updated"} }

    project.reload

    assert_redirected_to user_projects_path user_id: @user
    assert_equal project.name, "updated"
  end

  test "deleting a project will redirect to projects index path" do
    assert_difference 'Project.count', -1 do
      delete user_project_path user_id: @user, id: @project
    end

    assert_redirected_to user_projects_path user_id: @user
  end
end
