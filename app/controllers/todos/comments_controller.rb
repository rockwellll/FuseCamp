class Todos::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Todo.find params[:todo_id]
  end
end