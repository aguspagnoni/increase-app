class AddDiscountTypeRefToDiscounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :discounts, :discount_type, null: false, foreign_key: true
  end
end
