class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :booking_id
      t.integer :product_id
      t.integer :profile_id
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
