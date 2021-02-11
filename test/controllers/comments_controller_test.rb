require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @user = users :one
    @todo_set = todo_sets :two
    @project = projects :two
    sign_in @user
  end

  test 'will create a comment for a commentable model' do
    assert_difference 'Comment.count' do
      post todo_set_comments_path todo_set_id: @todo_set, params: {comment: {content: "This will be comment body"}}
    end
  end

  test 'will destroy a comment' do
    assert_difference 'Comment.count', -1 do
      delete comment_path comments(:one)
    end
  end
end
