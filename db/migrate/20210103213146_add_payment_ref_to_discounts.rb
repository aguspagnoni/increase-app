class AddPaymentRefToDiscounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :discounts, :payment, null: false, foreign_key: true
  end
end
