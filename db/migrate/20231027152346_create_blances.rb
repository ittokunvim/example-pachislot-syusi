class CreateBlances < ActiveRecord::Migration[7.0]
  def change
    create_table :blances do |t|
      t.date :date, null: false
      t.string :category, limit: 100
      t.string :name, limit: 1000
      t.integer :investment_money, limit: 4
      t.integer :recovery_money, limit: 4
      t.integer :investment_saving, limit: 4
      t.integer :recovery_saving, limit: 4
      t.float :rate, limit: 4, scale: 4
      t.string :store, limit: 1000
      t.text :note, limit: 1000

      t.timestamps
    end
  end
end
