class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_projects_path current_user
  end

  def show

    redirect_to user_projects_path current_user
  end


end
