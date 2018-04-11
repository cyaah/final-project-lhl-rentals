class AddTotalToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :total, :integer
  end
end
