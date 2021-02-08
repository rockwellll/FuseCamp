class TodoGroupsController < ApplicationController
  before_action :set_todo_set

  def create
    @project = @todo_set.project

    @todo_group = TodoSet.new todo_set_params
    @todo_group.parent = @todo_set
    @todo_group.creator = current_user
    @todo_group.project = @project


    respond_to do |format|
      @todo_group.save!
      Color.create! hex: params[:color], colorable: @todo_group

      format.turbo_stream do
        render turbo_stream: turbo_stream.append("todos-#{@todo_set.id}", partial: 'todo_groups/todo_group', locals: {group: @todo_group, todo_set: @todo_set})
      end
      format.html do
        redirect_to user_project_todo_set_path(user_id: current_user, project_id: @todo_set.project, id: @todo_set)
      end
    end
  end

  private

  def set_todo_set
    @todo_set = TodoSet.find params[:todo_set_id]
  end

  def todo_set_params
    params.require(:todo_set).permit :name, :description
  end
end
