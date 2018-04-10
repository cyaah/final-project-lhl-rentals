class AddTypeToReviews < ActiveRecord::Migration[5.1]
  def change
    #Type sets if reveiw to a RENTER = True LENDER = False
    add_column :reviews, :type, :bolean, default: false
  end
end
