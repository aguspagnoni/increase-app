class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :payment_api_id
      t.date :date

      t.timestamps
    end
  end
end
