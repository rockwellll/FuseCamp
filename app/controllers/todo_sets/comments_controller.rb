class TodoSets::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = TodoSet.find params[:todo_set_id]
  end
end