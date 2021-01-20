class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy edit update]

  def new
    @comment = @commentable.comments.new
  end

  def edit; end

  def update
    @comment.update comment_params

    respond_to do |format|
      format.turbo_stream do
        render 'comments/replace'
      end
    end
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.creator = current_user
    @comment.save

    respond_to do |format|
      format.turbo_stream
      format.html do
        redirect_back fallback_location: user_project_path(user_id: current_user, project_id: @project), notice: "Comment was created"
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream do
        render 'comments/remove'
      end

      format.html do
        redirect_back fallback_location: user_project_path(user_id: current_user, project_id: @project), notice: 'Comment was removed'
      end
    end
  end

  private
  def set_project
    @project = Project.find params[:project_id]
  end

  def comment_params
    params.require(:comment).permit :content
  end

  def set_comment
    @comment = Comment.find params[:id]
  end
end
