class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent
  before_action :set_todo, only: %i[update edit destroy]

  def create
    @todo = @todo_list.todos.new(todo_params) do |todo|
      todo.creator = current_user
    end

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to user_project_todo_lists_path(user_id: current_user, project_id: @todo_list.project.id), notice: "Success" }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@todo, partial: "todos/form", locals: {todo: @todo, todo_list: @todo_list})
        end
      end
    end
  end

  def new
    @todo = @todo_list.todos.new
    @todo = Todo.find params[:id] unless params[:id].nil?
  end

  def edit
  end

  def update
    @todo.status = !@todo.status

    respond_to do |format|
      @todo.save
      format.turbo_stream do
        @project = @todo_list.project

        return render 'todos/toggle'
      end
      format.html do
        redirect_to user_project_todo_lists_path(user_id: current_user, project_id: @todo_list.project.id), notice: "Success"
      end
    end
  end
  
  def destroy
    project = Project.find params[:project_id]
    project.put_in_trash @todo
    @todo.update! deleted_at: Date.new

    respond_to do |format|
      format.turbo_stream do
        render "todos/remove"
      end
      format.html { redirect_to user_project_todo_lists_path(user_id: current_user, project_id: @todo_list.project.id), notice: "Success" }
    end
  end

  private

  def set_parent
    @todo_list = TodoList.find params[:todo_list_id]
  end

  def todo_params
    params.require(:todo).permit :name, :notes
  end

  def set_todo
    @todo = Todo.find params[:id]
  end
end
