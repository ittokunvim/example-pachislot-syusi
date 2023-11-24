class Blance < ApplicationRecord
  has_one :history, class_name: "HistoryOrder", dependent: :destroy

  default_scope -> { order(date: :desc) }

  validates :date, presence: true
  validates :category, length: { maximum: 100 }
  validates :rate, numericality: { less_than: 2**10, allow_nil: true }

  # validates :name, :store, :note
  with_options length: { maximum: 1000 } do
    validates :name
    validates :store
    validates :note
  end

  # validates :investment_money, :recovery_money, :investment_saving, :recovery_saving
  with_options numericality: { less_than: 2**31, allow_nil: true } do
    validates :investment_money
    validates :recovery_money
    validates :investment_saving
    validates :recovery_saving
  end

  def result
    investment_money = self.investment_money.to_i
    recovery_money = self.recovery_money.to_i
    rate = self.rate.to_f
    investment_saving = self.investment_saving.to_i * rate
    recovery_saving = self.recovery_saving.to_i * rate
    result = recovery_money - investment_money + recovery_saving - investment_saving
    result.round
  end

  def histories
    return nil if history.nil?

    history.sort_order
  end
end
