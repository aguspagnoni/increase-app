class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_api_id
      t.integer :amount

      t.timestamps
    end
  end
end
