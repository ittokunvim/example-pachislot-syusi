require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "visiting the home" do
    visit root_url
    assert_text I18n.t("static_pages.home.headline")
    assert_text I18n.t("static_pages.home.description")
    assert_text I18n.t("static_pages.home.description2")
    assert_link I18n.t("static_pages.home.create_blance"), href: new_blance_path
  end
end
