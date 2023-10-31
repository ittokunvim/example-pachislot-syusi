require "test_helper"

class BlancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blance_list_url
    assert_response :success
  end

  test "should get new" do
    get new_blance_url
    assert_response :success
  end

  test "should post create" do
    post blances_url
    assert_response :success
  end

  test "should get show" do
    get blance_url(1)
    assert_response :success
  end

  test "should get edit" do
    get edit_blance_url(1)
    assert_response :success
  end

  test "should patch update" do
    patch blance_url(1)
    assert_response :success
  end

  test "should delete destroy" do
    delete blance_url(1)
    assert_response :success
  end
end
