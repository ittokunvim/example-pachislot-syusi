require "test_helper"

class BlancesHelperTest < ActionView::TestCase
  test "display_money should return string formatted in yen" do
    yen = 1000
    assert_equal "1,000円", display_money(yen)
  end

  test "display_money should return 0 yen if nil" do
    assert_equal "0円", display_money(nil)
  end

  test "show_display_saving should return string of formatted rate x saving" do
    saving = 460
    rate = 21.73
    assert_equal "460玉/枚 (9,996円)", show_display_saving(saving, rate)
  end

  test "show_display_saving should return 0 saving if nil" do
    rate = 21.73
    assert_equal "0玉/枚 (0円)", show_display_saving(nil, rate)
  end

  test "show_display_saving should return 0 rate if nil" do
    saving = 460
    assert_equal "460玉/枚 (0円)", show_display_saving(saving, nil)
  end

  test "show_display_rate should return string of formatted rate" do
    assert_equal "25玉/枚 (4円)", show_display_rate(4.0)
    assert_equal "100玉/枚 (1円)", show_display_rate(1.0)
    assert_equal "4.6玉/枚 (21.73円)", show_display_rate(21.73)
    assert_equal "18.4玉/枚 (5.43円)", show_display_rate(5.43)
    assert_equal "-", show_display_rate(nil)
  end
end
