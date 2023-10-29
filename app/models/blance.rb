class Blance < ApplicationRecord
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
end
