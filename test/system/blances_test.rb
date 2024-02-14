require "application_system_test_case"

class BlancesTest < ApplicationSystemTestCase
  include BlancesHelper

  setup do
    @blance = blances(:one)
    @blance.images.attach(
      io: File.open(Rails.root.join("test/fixtures/files/image.png")),
      filename: "image.png"
    )
  end

  test "visiting the index" do
    visit blances_url

    Blance.find_each do |blance|
      assert_text I18n.t("blances.blance.date", date: I18n.l(blance.date))
      assert_blance_result blance.result
      assert_text blance.total_investment_money
      assert_text blance.total_recovery_money
      assert_text blance.store || ""
      assert_text blance.name || ""
      assert_link I18n.t("blances.blance.show"), href: blance_path(blance)
      assert_link I18n.t("blances.blance.edit"), href: edit_blance_path(blance)
      assert_link I18n.t("blances.blance.destroy"), href: blance_path(blance)
      assert_link I18n.t("blances.blance.history"), href: blance_histories_path(blance)
    end
    assert_text I18n.t("blances.blance.investment")
    assert_text I18n.t("blances.blance.recovery")
    assert_text I18n.t("blances.blance.name")
    assert_text I18n.t("blances.blance.store")
    assert_link I18n.t("blances.index.new_blance"), href: new_blance_path
  end

  test "visiting the show" do
    # If there is no image in the blances, it will not be displayed.
    visit blance_url(blances(:two))
    assert_no_text I18n.t("blances.show.image")

    visit blance_url(@blance)

    @blance.attributes.each do |k, v|
      next if k == "id"

      case k
      when "date"
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_selector "td", text: I18n.l(v)
      when "investment_money", "recovery_money"
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_selector "td", text: display_money(v)
      when "investment_saving", "recovery_saving"
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_selector "td", text: show_display_saving(v, @blance.rate)
      when "rate"
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_selector "td", text: show_display_rate(v)
      when "result"
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_blance_result v
      when "created_at", "updated_at"
        assert_text I18n.l(v, format: :long)
      else
        assert_selector "th", text: Blance.human_attribute_name(k)
        assert_selector "td", text: v
      end
    end
    @blance.images_blobs.each do |blob|
      assert_selector "img[src$='#{blob.filename}']"
    end
    assert_text I18n.t("blances.show.image")
    assert_text I18n.t("blances.show.date")
    assert_text I18n.t("blances.show.blance")
    assert_text I18n.t("blances.show.machine")
    assert_text I18n.t("blances.show.store")
    assert_text I18n.t("blances.show.etc")
    assert_text I18n.t("blances.show.result")
    assert_link I18n.t("blances.show.edit_blance"), href: edit_blance_path(@blance)
    assert_link I18n.t("blances.show.show_history"), href: blance_histories_path(@blance)
    assert_link I18n.t("blances.show.delete_blance"), href: blance_path(@blance)
  end

  test "creating a Blance" do
    blance_name = "test_blance"
    visit new_blance_url

    # invalid input
    click_on I18n.t("blances.new.button_text")
    assert_selector "div#error_explanation"
    # invalid input with images
    fill_in I18n.t("activerecord.attributes.blance.date"), with: @blance.date
    attach_file I18n.t("activerecord.attributes.blance.images"), Rails.root.join("test/fixtures/files/video.mp4")
    click_on I18n.t("blances.new.button_text")
    assert_selector "div#error_explanation"
    # valid input
    fill_in I18n.t("activerecord.attributes.blance.date"), with: @blance.date
    select @blance.category, from: I18n.t("activerecord.attributes.blance.category")
    fill_in I18n.t("activerecord.attributes.blance.name"), with: blance_name
    assert_selector "option"
    fill_in I18n.t("activerecord.attributes.blance.investment_money"), with: @blance.investment_money
    fill_in I18n.t("activerecord.attributes.blance.recovery_money"), with: @blance.recovery_money
    fill_in I18n.t("activerecord.attributes.blance.investment_saving"), with: @blance.investment_saving
    fill_in I18n.t("activerecord.attributes.blance.recovery_saving"), with: @blance.recovery_saving
    select @blance.rate.to_s, from: I18n.t("activerecord.attributes.blance.rate")
    fill_in I18n.t("activerecord.attributes.blance.store"), with: @blance.store
    fill_in I18n.t("activerecord.attributes.blance.note"), with: @blance.note
    attach_file I18n.t("activerecord.attributes.blance.images"), Rails.root.join("test/fixtures/files/image.png")
    click_on I18n.t("blances.new.button_text")
    # check redirect
    assert_selector "div#flash_notice", text: I18n.t("blances.create.notice")
    assert_text blance_name
  end

  test "updating a Blance" do
    visit edit_blance_url(@blance)

    # invalid input
    fill_in I18n.t("activerecord.attributes.blance.date"), with: ""
    click_on I18n.t("blances.edit.button_text")
    assert_selector "div#error_explanation"
    # invalid input with images
    fill_in I18n.t("activerecord.attributes.blance.date"), with: Time.zone.today
    attach_file I18n.t("activerecord.attributes.blance.images"), Rails.root.join("test/fixtures/files/video.mp4")
    click_on I18n.t("blances.edit.button_text")
    assert_selector "div#error_explanation"
    # valid input
    fill_in I18n.t("activerecord.attributes.blance.date"), with: Time.zone.today
    click_on I18n.t("blances.edit.button_text")
    # check redirect
    assert_selector "div#flash_notice", text: I18n.t("blances.update.notice")
    assert_text I18n.l(Time.zone.today)
  end

  test "destroying a Blance" do
    visit blance_url(@blance)

    click_on I18n.t("blances.show.delete_blance")
    assert_match page.driver.browser.switch_to.alert.text, I18n.t("blances.show.confirm")
    page.driver.browser.switch_to.alert.accept
    assert_selector "div#flash_notice", text: I18n.t("blances.destroy.notice")
    assert_no_text @blance.name
  end

  def assert_blance_result(result)
    if result.zero?
      assert_selector "div.result.zero", text: display_money(result)
    elsif result.positive?
      assert_selector "div.result.plus", text: display_money(result)
    else
      assert_selector "div.result.minus", text: display_money(result)
    end
  end
end
