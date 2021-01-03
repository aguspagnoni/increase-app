class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.string :discount_api_id
      t.integer :amount

      t.timestamps
    end
  end
end
