require "application_system_test_case"

class LayoutsTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    # header
    assert_link "", href: root_path
    assert_text I18n.t("layouts.header.blance")
    find(".layouts__header .links button").hover
    assert_link I18n.t("layouts.header.index"), href: blances_path
    assert_link I18n.t("layouts.header.new"), href: new_blance_path
    # footer
    assert_link "Ruby on Rails", href: "https://rubyonrails.org/"
    assert_link "render", href: "https://render.com/"
    assert_link "PostgreSQL", href: "https://www.postgresql.org/"
    assert_link "GitHub", href: "https://github.com"
    assert_text "ittokunvim All Rights Reserved."
  end
end
