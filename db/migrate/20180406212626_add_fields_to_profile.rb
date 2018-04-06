class AddFieldsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :provider, :string
    add_column :profiles, :uid, :string
    add_column :profiles, :image, :string
  end
end
