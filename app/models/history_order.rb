class HistoryOrder < ApplicationRecord
  belongs_to :blance
  has_many :histories, dependent: :destroy

  ORDER_REGEX = /(\d+,)+\d+\Z/
  validates :order, length: { maximum: 1000 }, format: { with: ORDER_REGEX }, allow_blank: true

  def sort_order
    return histories if order.blank?

    order_array = order.split(',').map(&:to_i)
    histories.sort_by { |history| order_array.index(history.id) }
  end
end
