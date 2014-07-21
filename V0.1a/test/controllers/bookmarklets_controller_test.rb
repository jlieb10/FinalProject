require 'test_helper'

class BookmarkletsControllerTest < ActionController::TestCase
  setup do
    @bookmarklet = bookmarklets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarklets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmarklet" do
    assert_difference('Bookmarklet.count') do
      post :create, bookmarklet: {  }
    end

    assert_redirected_to bookmarklet_path(assigns(:bookmarklet))
  end

  test "should show bookmarklet" do
    get :show, id: @bookmarklet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookmarklet
    assert_response :success
  end

  test "should update bookmarklet" do
    patch :update, id: @bookmarklet, bookmarklet: {  }
    assert_redirected_to bookmarklet_path(assigns(:bookmarklet))
  end

  test "should destroy bookmarklet" do
    assert_difference('Bookmarklet.count', -1) do
      delete :destroy, id: @bookmarklet
    end

    assert_redirected_to bookmarklets_path
  end
end
