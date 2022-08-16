class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :pokemon_name
      t.integer :transaction_value
      t.integer :transaction_type
      t.boolean :enabled, default: true, null: false

      t.timestamps
    end
  end
end
