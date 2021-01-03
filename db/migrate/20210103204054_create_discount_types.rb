class CreateDiscountTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :discount_types do |t|
      t.string :discount_type_api_id
      t.string :name

      t.timestamps
    end
  end
end
