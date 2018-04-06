class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :price
      t.string :category
      t.date :start_availability
      t.date :end_availability

      t.timestamps null: false
    end
  end
end
