class MessageboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show]
  before_action :set_message_board, only: %i[show]
  def show
    @messages = @message_board.messages
  end

  protected

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_message_board
    @message_board = @project.message_board
  end
end
