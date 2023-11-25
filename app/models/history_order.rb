class HistoryOrder < ApplicationRecord
  belongs_to :blance

  ORDER_REGEX = /(\d+,)+\d+\Z/
  validates :order, length: { maximum: 1000 }, format: { with: ORDER_REGEX }, allow_blank: true
end
