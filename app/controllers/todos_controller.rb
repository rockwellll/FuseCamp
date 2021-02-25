class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parent, except: %i[show]
  before_action :set_todo, only: %i[update edit destroy show]

  def create
    @todo = @todo_set.todos.new(todo_params) do |todo|
      todo.creator = current_user
    end

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to user_project_todo_sets_path(user_id: current_user, project_id: @todo_set.project.id), notice: 'Success' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@todo, partial: 'todos/form', locals: {todo: @todo, todo_set: @todo_set})
        end
      end
    end
  end

  def show; end

  def new
    @todo = @todo_set.todos.new
    @todo = Todo.find params[:id] unless params[:id].nil?
  end

  def edit
  end

  def update
    old_status = @todo.status
    respond_to do |format|

      @todo.update(todo_params)
      format.turbo_stream do
        @project = @todo_set.project
        return render 'todos/toggle' if old_status != @todo.status

        render turbo_stream: turbo_stream.replace(@todo, partial: 'todos/todo', locals: {todo: @todo})
      end

      format.html do
        redirect_to user_project_todo_sets_path(user_id: current_user, project_id: @todo_set.project.id), notice: 'Success'
      end
    end
  end

  def destroy
    @todo.put_in_project_trash

    respond_to do |format|
      format.turbo_stream do
        render 'todos/remove'
      end
      format.html { redirect_to user_project_todoSets_path(user_id: current_user, project_id: @todo_set.project.id), notice: 'Success' }
    end
  end

  private

  def set_parent
    @todo_set = TodoSet.find params[:todo_set_id]
  end

  def todo_params
    params.require(:todo).permit :name, :notes, :starts_at, :ends_at, :deadline, :status
  end

  def set_todo
    @todo = Todo.find params[:id]
  end
end
