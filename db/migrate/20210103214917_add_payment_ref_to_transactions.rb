class AddPaymentRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :payment, null: false, foreign_key: true
  end
end
