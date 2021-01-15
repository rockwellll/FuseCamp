class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def new; end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.creator = current_user
    @comment.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  private
  def set_project
    @project = Project.find params[:project_id]
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
