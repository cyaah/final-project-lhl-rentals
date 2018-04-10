class AddUserToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user
    remove_reference :reviews, :booking
  end
end
