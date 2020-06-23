require 'test_helper'

class BinControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bin_new_url
    assert_response :success
  end

end
