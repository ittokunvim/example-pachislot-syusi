require "test_helper"

class HistoryTest < ActiveSupport::TestCase
  def setup
    @history = histories(:one)
  end

  test "should be valid" do
    assert @history.valid?
  end
end
