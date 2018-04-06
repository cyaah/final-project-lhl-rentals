class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :product_id
      t.integer :profile_id
      t.date :start_date
      t.date :end_date
      t.integer :price_per_day
      t.integer :security_deposit

      t.timestamps null: false 
    end
  end
end
