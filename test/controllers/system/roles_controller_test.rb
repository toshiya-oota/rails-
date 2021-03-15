require 'test_helper'

class System::RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get system_roles_index_url
    assert_response :success
  end

  test "should get new" do
    get system_roles_new_url
    assert_response :success
  end

  test "should get edit" do
    get system_roles_edit_url
    assert_response :success
  end

end
