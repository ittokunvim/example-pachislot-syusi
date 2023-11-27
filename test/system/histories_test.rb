require "application_system_test_case"

class HistoriesTest < ApplicationSystemTestCase
  setup do
    @blance = blances(:one)
    @histories = @blance.histories
  end

  test "visiting the index" do
    # no history
    visit blance_index_history_url(blances(:most_recent))
    assert_text I18n.t("histories.index.no_history")
    # has history
    visit blance_index_history_url(@blance)
    excepted_columns = %w[id created_at updated_at blance_id]
    @histories.each do |history|
      history.attributes.each do |k, v|
        next if excepted_columns.include?(k)
        assert_selector "th", text: History.human_attribute_name(k)
        assert_selector "td", text: v
      end
      assert_text I18n.t("histories.index.operation")
      assert_link I18n.t("histories.history.edit"), href: edit_blance_history_path(@blance, history)
      assert_link I18n.t("histories.history.destroy"), href: blance_history_path(@blance, history)
    end
  end

  test "creating a History" do
    @history = @histories.first
    @history.memo = "testtest"
    visit blance_index_history_url(@blance)

    # invalid input
    click_on I18n.t("histories.index.button_text")
    assert_selector "div#flash_alert"
    # valid input
    fill_in I18n.t("activerecord.attributes.history.game_count"), with: @history.game_count
    fill_in I18n.t("activerecord.attributes.history.chance"), with: @history.chance
    fill_in I18n.t("activerecord.attributes.history.investment"), with: @history.investment
    fill_in I18n.t("activerecord.attributes.history.memo"), with: @history.memo
    click_on I18n.t("histories.index.button_text")
    # check redirect
    assert_selector "div#flash_notice", text: I18n.t("histories.create.notice")
    assert_text @history.memo
  end

  test "updating a History" do
    @history = @histories.first
    @history.memo = "testtest"
    visit edit_blance_history_url(@blance, @history)

    # invalid input
    fill_in I18n.t("activerecord.attributes.history.game_count"), with: ""
    click_on I18n.t("histories.edit.button_text")
    assert_selector "div#flash_alert"
    # valid input
    fill_in I18n.t("activerecord.attributes.history.memo"), with: @history.memo
    click_on I18n.t("histories.edit.button_text")
    # check redirect
    assert_selector "div#flash_notice", text: I18n.t("histories.update.notice")
    assert_text @history.memo
  end
end
