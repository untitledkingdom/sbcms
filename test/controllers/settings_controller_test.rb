require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should redirect if not authorized" do
    get :edit
    assert_redirected_to new_session_path
  end

  test "edit page is accesible" do
    sign_in

    get :edit
    assert_response :success
  end

  test "should create settings" do
    post :create, params: { password: '12345678', imgur_integration: '12345678' }

    assert_equal Settings.imgur_integration, '12345678'

    assert_redirected_to root_path
  end

  test "should update settings" do
    sign_in

    post :update, params: { password: '12345678', imgur_integration: '87654321' }

    assert_equal Settings.imgur_integration, '87654321'

    assert_redirected_to root_path
  end
end
