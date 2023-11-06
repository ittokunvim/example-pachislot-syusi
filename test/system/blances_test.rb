require "application_system_test_case"

class BlancesTest < ApplicationSystemTestCase
  setup do
    @blance = blances(:one)
  end

  test "visiting the index" do
    visit blance_list_url

    Blance.all.each do |blance|
      blance.attributes.each do |k, v|
        assert_selector "th", text: Blance.human_attribute_name(k)
        case k
        when "date"
          assert_selector "td", text: I18n.l(v)
        when "created_at", "updated_at"
          assert_selector "td", text: time_ago_in_words(v)
        else
          assert_selector "td", text: v
        end
      end
    end
  end

  test "visiting the show" do
    visit blance_url(@blance)

    @blance.attributes.each do |k, v|
      assert_selector "th", text: Blance.human_attribute_name(k)
      case k
      when "date"
        assert_selector "td", text: I18n.l(v)
      when "created_at", "updated_at"
        assert_selector "td", text: time_ago_in_words(v)
      else
        assert_selector "td", text: v
      end
    end
  end

  test "creating a Blance" do
    blance_name = "test_blance"
    visit new_blance_url

    # invalid input
    click_on I18n.t("blances.new.button_text")
    assert_selector "div#error_explanation"
    # valid input
    fill_in I18n.t("activerecord.attributes.blance.date"), with: @blance.date
    select @blance.category, from: I18n.t("activerecord.attributes.blance.category")
    fill_in I18n.t("activerecord.attributes.blance.name"), with: blance_name
    fill_in I18n.t("activerecord.attributes.blance.investment_money"), with: @blance.investment_money
    fill_in I18n.t("activerecord.attributes.blance.recovery_money"), with: @blance.recovery_money
    fill_in I18n.t("activerecord.attributes.blance.investment_saving"), with: @blance.investment_saving
    fill_in I18n.t("activerecord.attributes.blance.recovery_saving"), with: @blance.recovery_saving
    select @blance.rate.to_s, from: I18n.t("activerecord.attributes.blance.rate")
    fill_in I18n.t("activerecord.attributes.blance.store"), with: @blance.store
    fill_in I18n.t("activerecord.attributes.blance.note"), with: @blance.note
    click_on I18n.t("blances.new.button_text")
    # check redirect
    assert_selector "div#notice"
    assert_text blance_name
  end

  test "updating a Blance" do
    blance_name = "test_blance"
    visit edit_blance_url(@blance)

    # invalid input
    fill_in I18n.t("activerecord.attributes.blance.name"), with: "a" * 1001
    click_on I18n.t("blances.edit.button_text")
    assert_selector "div#error_explanation"
    # valid input
    fill_in I18n.t("activerecord.attributes.blance.name"), with: blance_name
    click_on I18n.t("blances.edit.button_text")
    # check redirect
    assert_selector "div#notice"
    assert_text blance_name
   end

  test "destroying a Blance" do
    visit edit_blance_url(@blance)

    click_on I18n.t("blances.edit.delete")
    assert_match page.driver.browser.switch_to.alert.text, I18n.t("blances.edit.confirm")
    page.driver.browser.switch_to.alert.accept
    assert_selector "div#notice"
    assert_no_text @blance.name
  end
end
