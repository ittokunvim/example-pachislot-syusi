require "application_system_test_case"

class HelloTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit hello_url
    assert_text "Hello, World!"
    assert_selector "p", text: "Hello, Rails!"
  end
end
