class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.integer :game_count, null: false, limit: 4
      t.string :chance, null: false, limit: 100
      t.string :investment, null: false, limit: 100
      t.text :memo, limit: 1000

      t.timestamps
    end
  end
end
