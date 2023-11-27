require "application_system_test_case"

class HistoriesTest < ApplicationSystemTestCase
  setup do
    @blance = blances(:one)
    @histories = @blance.histories
  end

  test "visiting the index" do
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
end
