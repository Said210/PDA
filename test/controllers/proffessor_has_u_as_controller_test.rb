require 'test_helper'

class ProfessorAndUAsControllerTest < ActionController::TestCase
  setup do
    @Professor_and_ua = Professor_and_uas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:Professor_and_uas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create Professor_and_ua" do
    assert_difference('ProfessorAndUa.count') do
      post :create, Professor_and_ua: { professor: @Professor_and_ua.professor, relation: @Professor_and_ua.relation, ua: @Professor_and_ua.ua }
    end

    assert_redirected_to Professor_and_ua_path(assigns(:Professor_and_ua))
  end

  test "should show Professor_and_ua" do
    get :show, id: @Professor_and_ua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @Professor_and_ua
    assert_response :success
  end

  test "should update Professor_and_ua" do
    patch :update, id: @Professor_and_ua, Professor_and_ua: { professor: @Professor_and_ua.professor, relation: @Professor_and_ua.relation, ua: @Professor_and_ua.ua }
    assert_redirected_to Professor_and_ua_path(assigns(:Professor_and_ua))
  end

  test "should destroy Professor_and_ua" do
    assert_difference('ProfessorAndUa.count', -1) do
      delete :destroy, id: @Professor_and_ua
    end
  end
end
