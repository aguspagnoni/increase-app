class AddTransactionTypeRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :transaction_type, null: false, foreign_key: true
  end
end
