require "test_helper"

class Dashboard::User::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_user_settings_index_url
    assert_response :success
  end
end
