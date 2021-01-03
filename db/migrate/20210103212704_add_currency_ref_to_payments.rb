class AddCurrencyRefToPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :currency, null: false, foreign_key: true
  end
end
