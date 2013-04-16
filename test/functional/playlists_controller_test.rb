require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "user can create playlist" do
    get :create
    assert_response :success
  end
end
