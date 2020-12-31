require 'test_helper'

class T1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t1 = t1s(:one)
  end

  test "should get index" do
    get t1s_url
    assert_response :success
  end

  test "should get new" do
    get new_t1_url
    assert_response :success
  end

  test "should create t1" do
    assert_difference('T1.count') do
      post t1s_url, params: { t1: {  } }
    end

    assert_redirected_to t1_url(T1.last)
  end

  test "should show t1" do
    get t1_url(@t1)
    assert_response :success
  end

  test "should get edit" do
    get edit_t1_url(@t1)
    assert_response :success
  end

  test "should update t1" do
    patch t1_url(@t1), params: { t1: {  } }
    assert_redirected_to t1_url(@t1)
  end

  test "should destroy t1" do
    assert_difference('T1.count', -1) do
      delete t1_url(@t1)
    end

    assert_redirected_to t1s_url
  end
end
