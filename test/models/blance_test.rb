require "test_helper"

class BlanceTest < ActiveSupport::TestCase
  def setup
    @blance = blances(:one)
  end

  test "should be valid" do
    assert @blance.valid?
  end

  test "should be invalid" do
    assert Blance.new.invalid?
  end

  test "order should be most recent first" do
    assert_equal blances(:most_recent), Blance.first
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

  test "investment_money should be integer" do
    @blance.investment_money = "hogebar"
    assert_not @blance.valid?
  end

  test "investment_money should not be too long" do
    @blance.investment_money = (2**31) + 1
    assert_not @blance.valid?
  end

  test "recovery_money should be integer" do
    @blance.recovery_money = "hogebar"
    assert_not @blance.valid?
  end

  test "recovery_money should not be too long" do
    @blance.recovery_money = (2**31) + 1
    assert_not @blance.valid?
  end

  test "investment_saving should be integer" do
    @blance.investment_saving = "hogebar"
    assert_not @blance.valid?
  end

  test "investment_saving should not be too long" do
    @blance.investment_saving = (2**31) + 1
    assert_not @blance.valid?
  end

  test "recovery_saving should be integer" do
    @blance.recovery_saving = "hogebar"
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

  # test "rate decimal point should not be too long" do
  #   @blance.rate = 1.123456789
  #   assert_not @blance.valid?
  # end

  test "store should not be too long" do
    @blance.store = "a" * 1001
    assert_not @blance.valid?
  end

  test "note should not be too long" do
    @blance.note = "a" * 1001
    assert_not @blance.valid?
  end

  test "associated history_order should be valid" do
    assert @blance.history_order
  end

  test "associated history_order should be destroyed" do
    assert_difference "HistoryOrder.count", -1 do
      @blance.destroy
    end
  end

  test "associated histories should be valid" do
    assert @blance.histories
  end

  test "associated histories should be destroyed" do
    assert_difference "History.count", -3 do
      @blance.destroy
    end
  end

  test "result() should be correct (rate: 4.0)" do
    blance = Blance.new(
      investment_money: 24_000,
      recovery_money: 30_000,
      investment_saving: 2500,
      recovery_saving: 4000,
      rate: 4.0
    )
    assert_equal 12_000, blance.result
  end

  test "result() should be correct (rate: 21.73)" do
    blance = Blance.new(
      investment_money: 10_000,
      recovery_money: 20_000,
      investment_saving: 460,
      recovery_saving: 920,
      rate: 21.73
    )
    assert_equal 19_996, blance.result
  end

  test "result() should be return 0" do
    blance = Blance.new(
      investment_money: nil,
      recovery_money: nil,
      investment_saving: nil,
      recovery_saving: nil,
      rate: nil
    )
    assert_equal 0, blance.result
  end

  test "sort_histories() returns an arbitrarily ordered histories" do
    order = @blance.history_order.order
    assert_equal order.split(",").map(&:to_i), @blance.sort_histories.map(&:id)
  end

  test "sort_histories() returns histories when order is nil" do
    @blance.history_order.order = nil
    assert_equal @blance.histories, @blance.sort_histories
  end
end
