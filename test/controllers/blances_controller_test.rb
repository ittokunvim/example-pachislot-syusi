require "test_helper"

class BlancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blance = blances(:one)
    @page_title = "パチスロ収支アプリ | "
  end

  test "should get index" do
    get blance_list_url
    assert_response :success
    assert_select "title", @page_title + I18n.t("blances.index.title")
  end

  test "should get show" do
    get blance_url @blance
    assert_response :success
    assert_select "title", @page_title + I18n.t("blances.show.title", date: I18n.l(@blance.date))
  end

  test "should get new" do
    get new_blance_url
    assert_response :success
    assert_select "title", @page_title + I18n.t("blances.new.title")
  end

  test "should get edit" do
    get edit_blance_url @blance
    assert_response :success
    assert_select "title", @page_title + I18n.t("blances.edit.title", date: I18n.l(@blance.date))
  end

  test "should post create" do
    post blances_url
    assert_response :success
  end

  test "should patch update" do
    patch blance_url @blance
    assert_response :success
  end

  test "should delete destroy" do
    delete blance_url @blance
    assert_response :success
  end
end
