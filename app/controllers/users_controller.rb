class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @booking = @user.bookings
    @product = @user.products
  end
end
