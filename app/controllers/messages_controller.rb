class MessagesController < ApplicationController
  before_action :set_project, only: [:new]
  before_action :set_messageboard, only: [:create]

  def new
    @message = @project.message_board.messages.new
  end

  def create
    @message = @message_board.messages.new message_params
    @message.user = current_user

    @message.save!

    respond_to do |format|
      if @message.save
        format.html do
        redirect_to account_project_message_board_url(current_user.account,@message_board.project, @message_board)
        end

      else
        @project = @message_board.project
        format.html do
           render :new, status: :unprocessable_entity
        end
      end
    end
  end

  protected

  def message_params
    params.require(:message).permit(:body, :title, :category, :status)
  end

  def set_messageboard
    @message_board = MessageBoard.find params[:message_board_id]
  end

  def set_project
    @project = Project.find params[:project_id]
  end
end
