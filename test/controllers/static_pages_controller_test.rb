require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "#{ConstantParameters::SITENAME} | パチスロの収支を記録するサービス"
  end
end
