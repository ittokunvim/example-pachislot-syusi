class AddBlanceToHistoryOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :history_orders, :blance, null: false, foreign_key: true
  end
end
