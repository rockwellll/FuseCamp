class PeoplesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account

  def index
    @members = @account.people
  end

  def create
    @person = Person.new person_params
    @person.user.is_member = true
    @person.account = @account

    respond_to do |format|
      if @person.save
        format.html {  redirect_to account_peoples_path account_id: @account, notice: "New person added successfully"}
      else
        format.html { render :new }
      end
    end
  end

  def new
    @person = Person.new
    @user = User.new is_member: true
  end

  private
  def set_account
    @account = Account.find params[:account_id]
  end

  def person_params
    params.require(:person).permit(:job_title, user_attributes: [:name, :email, :password, :is_member])
  end
end
