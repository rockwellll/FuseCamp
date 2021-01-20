class BoostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_boost, only: [:destroy]

  def create
    @boost = @boostable.boosts.new boost_params
    @boost.creator = current_user

    respond_to do |format|
        format.turbo_stream
    end
  end

  def destroy
    @boost.destroy

    respond_to do |format|
      format.turbo_stream { render 'boosts/remove'}
    end
  end

  private

  def set_boost
    @boost = Boost.find params[:id]
  end

  def boost_params
    params.require(:boost).permit :message
  end
end
