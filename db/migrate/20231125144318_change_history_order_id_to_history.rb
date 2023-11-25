class ChangeHistoryOrderIdToHistory < ActiveRecord::Migration[7.0]
  def change
    remove_reference :histories, :history_order, null: false, foreign_key: true
    add_reference :histories, :blance, null: false, foreign_key: true
  end
end
