require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    users(:one).save!
    @micropost = microposts(:one)
=begin
    for _ in 0..100 do
      pp users
    end
=end
  end

  test "should get index" do
    get microposts_url
    assert_response :success
  end

  test "should get new" do
    get new_micropost_url
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post microposts_url, params: { micropost: { context: @micropost.context, user_id: User.first.id } }
    end

    assert_redirected_to micropost_url(Micropost.last)
  end

  test "should show micropost" do
    get micropost_url(@micropost)
    assert_response :success
  end

  test "should get edit" do
    get edit_micropost_url(@micropost)
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { context: @micropost.context, user_id: User.first.id } }
    assert_redirected_to micropost_url(@micropost)
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end