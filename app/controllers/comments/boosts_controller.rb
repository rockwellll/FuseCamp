class Comments::BoostsController < BoostsController
  before_action :set_boostable

  private

  def set_boostable
    @boostable = Comment.find params[:comment_id]
  end
end