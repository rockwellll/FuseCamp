class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:index, :create]
  before_action :set_todo_list, only: %i[ show]

  def index
    @todolist = TodoList.new
  end

  def create
    @todo_list = @project.todo_lists.new(todo_params) do |todo_list|
      todo_list.creator = current_user
    end

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to user_project_todo_list_path(user_id: current_user, project_id: @project, id: @todo_list), notice: "Todo was successfully created" }
        format.json { render json: @todo_list.to_json }
      else
        format.html { redirect_to user_project_path(user_id: current_user.id, id: @project.id) } ## Specify the format in which you are rendering "new" page
        format.json { render json: @todo_list.errors }
      end
    end
  end

  private

  def todo_params
    params.require(:todo_list).permit :name, :description
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_todo_list
    @todo_list = TodoList.find params[:id]
  end
end
