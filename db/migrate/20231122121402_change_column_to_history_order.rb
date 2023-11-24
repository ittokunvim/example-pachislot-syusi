class ChangeColumnToHistoryOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :history_orders, :order, :string, null: true, limit: 1000
  end
end
