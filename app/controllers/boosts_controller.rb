class BoostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_boost, only: [:destroy]

  def create
    @boost = @boostable.boosts.new boost_params
    @boost.creator = current_user

    respond_to do |format|
      if @boost.save
        format.turbo_stream
        format.html do
          redirect_back fallback_location: root_path
        end
      end
    end
  end

  def destroy
    @boost.destroy

    respond_to do |format|
      format.turbo_stream { render 'boosts/remove'}
      format.html do
        redirect_back fallback_location: root_path, notice: "deleted successfully"
      end
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
