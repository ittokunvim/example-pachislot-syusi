require "test_helper"

class HistoryOrderTest < ActiveSupport::TestCase
  def setup
    @history_order = history_orders(:one)
  end

  test "should be valid" do
    assert @history_order.valid?
  end

  test "order should not be too long" do
    @history_order.order = "a" * 1001
    assert_not @history_order.valid?
  end

  test "order should be valid format" do
    valid_orders = %w[1,2,3 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    valid_orders.each do |valid_order|
      @history_order.order = valid_order
      assert @history_order.valid?, "#{valid_order.inspect} should be valid"
    end
  end

  test "order should be invalid format" do
    invalid_orders = %w[
      hogebar
      1, 2, 3, 4, 5
      6,7,8,9,10,11,
      12,13, 14,15, 16
    ]
    invalid_orders.each do |invalid_order|
      @history_order.order = invalid_order
      assert @history_order.invalid?, "#{invalid_order.inspect} should be invalid"
    end
  end

  test "order allow blank" do
    @history_order.order = "     "
    assert @history_order.valid?
  end

  test "associated blance should be valid" do
    @history_order.save
    assert @history_order.blance
  end

  test "associated histories should be valid" do
    @history_order.save
    assert @history_order.histories
  end

  test "associated history should be destroyed" do
    @history_order.save
    assert_difference "History.count", -1 do
      @history_order.destroy
    end
  end
end
