class AdministratorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account

  def index; end

  private

  def set_account
    @account = Account.find params[:account_id]
  end
end
