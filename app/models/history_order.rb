class HistoryOrder < ApplicationRecord
  has_many :histories, dependent: :destroy

  ORDER_REGEX = /(\d+,)+\d+\Z/
  validates :order, length: { maximum: 1000 }, format: { with: ORDER_REGEX }, allow_blank: true
end
