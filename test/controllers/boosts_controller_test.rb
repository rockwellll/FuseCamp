require 'test_helper'

class BoostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users :one
    @comment = comments :one

    sign_in @user
  end

  test 'it boosts a boostable' do
    old_count = @comment.boosts.count

    assert_difference 'Boost.count' do
      post comment_boosts_path comment_id: @comment.id, params: {boost: {message: "some new boost"}}
    end

    assert_not_equal @comment.boosts.count, old_count
  end

  test "a boost can be destroyed" do
    assert_difference 'Boost.count', -1 do
      delete boost_path boosts(:one)
    end
  end
end
