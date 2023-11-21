class CreateHistoryOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :history_orders do |t|
      t.string :order, null: false, limit: 1000

      t.timestamps
    end
  end
end
