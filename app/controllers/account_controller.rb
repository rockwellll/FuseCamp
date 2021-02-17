class AccountController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account

  def index
    redirect_to account_projects_path account_id: @account
  end
  private

  def set_account
    @account = Account.find_by_user_id current_user
  end
end
