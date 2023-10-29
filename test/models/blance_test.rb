require "test_helper"

class BlanceTest < ActiveSupport::TestCase
  def setup
    @blance = blances(:one)
  end

  test "should be valid" do
    assert @blance.valid?
  end

  test "date should be present" do
    @blance.date = "     "
    assert_not @blance.valid?
  end

  test "category should not be too long" do
    @blance.category = "a" * 101
    assert_not @blance.valid?
  end

  test "name should not be too long" do
    @blance.name = "a" * 1001
    assert_not @blance.valid?
  end

  test "investment_money should not be too long" do
    @blance.investment_money = (2**31) + 1
    assert_not @blance.valid?
  end

  test "recovery_money should not be too long" do
    @blance.recovery_money = (2**31) + 1
    assert_not @blance.valid?
  end

  test "investment_saving should not be too long" do
    @blance.investment_saving = (2**31) + 1
    assert_not @blance.valid?
  end

  test "recovery_saving should not be too long" do
    @blance.recovery_saving = (2**31) + 1
    assert_not @blance.valid?
  end

  test "rate should not be too long" do
    @blance.rate = (2**10) + 1
    assert_not @blance.valid?
  end

  test "rate decimal point should not be too long" do
    @blance.rate = 1.123456789
    assert_not @blance.valid?
  end

  test "store should not be too long" do
    @blance.store = "a" * 1001
    assert_not @blance.valid?
  end

  test "note should not be too long" do
    @blance.note = "a" * 1001
    assert_not @blance.valid?
  end
end
