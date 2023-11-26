require "test_helper"

class BlancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blance = blances(:one)
    @blance_hash = @blance.attributes
    @blance_hash["date"] = @blance.date + 1.year
    @blance_hash.delete("id")
    @blance_hash.delete("created_at")
    @blance_hash.delete("updated_at")
    @page_title = "パチスロ収支アプリ | "
  end

  test "should get index" do
    get blances_url
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
    assert_difference("Blance.count", 1) do
      post blances_url, params: { blance: @blance_hash }
    end
    assert_redirected_to blance_url Blance.first
  end

  test "should return bad_request when post create" do
    @blance_hash["date"] = nil
    assert_no_difference("Blance.count") do
      post blances_url, params: { blance: @blance_hash }
    end
    assert_response :bad_request
  end

  test "should patch update" do
    @blance_hash["name"] = "test"
    assert_changes -> { @blance.name } do
      patch blance_url @blance, params: { blance: @blance_hash }
      @blance.reload
    end
    assert_redirected_to blance_url @blance
  end

  test "should return bad_request when patch update" do
    @blance_hash["category"] = "a" * 101
    assert_no_changes -> { @blance.category } do
      patch blance_url @blance, params: { blance: @blance_hash }
      @blance.reload
    end
    assert_response :bad_request
  end

  test "should delete destroy" do
    assert_difference("Blance.count", -1) do
      delete blance_url @blance
    end
    assert_redirected_to blances_url
  end
end
