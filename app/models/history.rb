class History < ApplicationRecord
  belongs_to :blance

  validates :game_count, presence: true, numericality: { less_than: 2**31 }
  validates :chance, presence: true, length: { maximum: 100 }
  validates :investment, presence: true, length: { maximum: 100 }
  validates :memo, length: { maximum: 1000 }
end
