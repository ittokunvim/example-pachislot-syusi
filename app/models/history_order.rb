class HistoryOrder < ApplicationRecord
  ORDER_REGEX = /(\d+,)+\d+\Z/
  validates :order, presence: true, length: { maximum: 1000 }, format: { with: ORDER_REGEX }
end
