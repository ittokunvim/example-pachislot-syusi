require "test_helper"

class HistoryTest < ActiveSupport::TestCase
  def setup
    @history = histories(:one)
  end

  test "should be valid" do
    assert @history.valid?
  end

  test "should be invalid" do
    assert History.new.invalid?
  end

  test "game_count should be present" do
    @history.game_count = "     "
    assert_not @history.valid?
  end

  test "game_count should be integer" do
    @history.game_count = "hogebar"
    assert_not @history.valid?
  end

  test "game_count should not be too long" do
    @history.game_count = (2**31) + 1
    assert_not @history.valid?
  end

  test "chance should be present" do
    @history.chance = "     "
    assert_not @history.valid?
  end

  test "chance should not be too long" do
    @history.chance = "a" * 101
    assert_not @history.valid?
  end

  test "investment should be present" do
    @history.investment = "     "
    assert_not @history.valid?
  end

  test "investment should not be too long" do
    @history.investment = "a" * 101
    assert_not @history.valid?
  end

  test "memo should not be too long" do
    @history.memo = "a" * 1001
    assert_not @history.valid?
  end

  test "associated blance should be valid" do
    assert @history.blance
  end
end
