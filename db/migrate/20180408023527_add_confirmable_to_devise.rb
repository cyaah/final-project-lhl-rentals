class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :confirmation_token, :string
    add_column :profiles, :confirmed_at, :datetime
    add_column :profiles, :confirmation_sent_at, :datetime

    add_index :profiles, :confirmation_token, unique: true
  end
end
