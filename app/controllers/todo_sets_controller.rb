class TodoSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[index create destroy show edit update]
  before_action :set_todo_list, only: %i[show destroy edit update]

  def index
    @todoset = TodoSet.new
  end

  def edit

  end

  def create
    @todo_set = @project.todo_sets.new(todo_set_params) do |todo_list|
      todo_list.creator = current_user
    end

    respond_to do |format|
      if @todo_set.save
        format.html { redirect_to user_project_todo_set_path(user_id: current_user, project_id: @project, id: @todo_set)}
        format.json { render json: @todo_set.to_json }
      else
        format.html { redirect_to user_project_path(user_id: current_user.id, id: @project.id) } ## Specify the format in which you are rendering "new" page
        format.json { render json: @todo_set.errors }
      end
    end
  end

  def destroy
    @id = @todo_set.id
    @todo_set.put_in_project_trash
    respond_to do |format|
      format.html {
        redirect_to user_project_todo_sets_path(user_id: current_user.id, project_id: @project.id), notice: "Todoset was successfully put inside the trash"
      }
    end
  end

  def update
    @todo_set.update todo_set_params

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          @todo_set, partial: 'todo_sets/partials/header',
                     locals: { todo_set: @todo_set }
        )
      end

      format.html do
        redirect_to user_project_todo_set_path(user_id: current_user.id, project_id: @project, id: @todo_set), notice: "Todoset was updated successfully "
      end
    end
  end

  private

  def todo_set_params
    params.require(:todo_set).permit :name, :description
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_todo_list
    @todo_set = TodoSet.unscoped.find params[:id]
  end
end
