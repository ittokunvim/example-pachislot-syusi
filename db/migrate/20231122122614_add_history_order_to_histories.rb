class AddHistoryOrderToHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :histories, :history_order, null: false, foreign_key: true
  end
end
