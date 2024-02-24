require "test_helper"

class HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history = histories(:one)
    @blance = @history.blance
    @history_hash = @history.attributes
    @history_hash.delete("id")
    @history_hash.delete("blance_id")
    @history_hash.delete("created_at")
    @history_hash.delete("updated_at")
    @page_title = "#{ConstantParameters::SITENAME} | "
  end

  test "should get index" do
    get blance_histories_url @blance
    assert_response :success
    assert_select "title", @page_title + I18n.t("histories.index.title", date: I18n.l(@blance.date))
  end

  test "should get edit" do
    get edit_blance_history_url @blance, @history
    assert_response :success
    assert_select "title", @page_title + I18n.t("histories.edit.title", date: I18n.l(@blance.date))
  end

  test "should post create" do
    assert_difference("History.count", 1) do
      post blance_histories_url @blance, params: { history: @history_hash }
    end
  end

  test "should return bad_request when post create" do
    @history_hash["game_count"] = nil
    assert_no_difference("History.count") do
      post blance_histories_url @blance, params: { history: @history_hash }
    end
    assert_response :bad_request
  end

  test "should patch update" do
    @history_hash["game_count"] = 100
    assert_changes -> { @history.game_count } do
      patch blance_history_url @blance, @history, params: { history: @history_hash }
      @history.reload
    end
    assert_redirected_to blance_histories_url(@blance)
  end

  test "should return bad_request when patch update" do
    @history_hash["chance"] = "a" * 101
    assert_no_changes -> { @history.chance } do
      patch blance_history_url @blance, @history, params: { history: @history_hash }
      @history.reload
    end
    assert_response :bad_request
  end

  test "should delete destroy" do
    assert_difference("History.count", -1) do
      delete blance_history_url @blance, @history
    end
    assert_redirected_to blance_histories_url(@blance)
  end
end
