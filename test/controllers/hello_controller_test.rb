require "test_helper"

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get hello_url
    assert_response :success
    assert_select "title", "#{ConstantParameters::SITENAME} | やっはろー"
  end
end
