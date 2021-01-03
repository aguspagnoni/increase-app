class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.string :transaction_type_api_id
      t.string :name

      t.timestamps
    end
  end
end
