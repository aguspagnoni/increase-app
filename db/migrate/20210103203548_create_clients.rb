class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.text :client_api_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :job
      t.string :country
      t.string :address
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
