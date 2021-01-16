class TodoSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[index create destroy show]
  before_action :set_todo_list, only: %i[show destroy]

  def index
    @todoset = TodoSet.new
  end

  def create
    @todo_set = @project.todo_sets.new(todo_params) do |todo_list|
      todo_list.creator = current_user
    end

    respond_to do |format|
      if @todo_set.save
        format.html { redirect_to user_project_todo_set_path(user_id: current_user, project_id: @project, id: @todo_set), notice: "Todo was successfully created" }
        format.json { render json: @todo_set.to_json }
      else
        format.html { redirect_to user_project_path(user_id: current_user.id, id: @project.id) } ## Specify the format in which you are rendering "new" page
        format.json { render json: @todo_set.errors }
      end
    end
  end

  def destroy
    @id = @todo_set.id
    @todo_set.destroy
    respond_to do |format|
      format.turbo_stream do
        render 'todo_sets/remove'
      end
      format.html {
        redirect_to user_project_todo_sets_path(user_id: current_user.id, project_id: @project.id)
      }
    end
  end
  private

  def todo_params
    params.require(:todo_set).permit :name, :description
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_todo_list
    @todo_set = TodoSet.find params[:id]
  end
end
