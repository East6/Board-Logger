require 'test_helper'

class GpSsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gp_ss_create_url
    assert_response :success
  end

end
