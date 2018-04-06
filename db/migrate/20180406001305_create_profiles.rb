class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.text :phone
      t.text :address
      t.string :email

      t.timestamps null:false
    end
  end
end
