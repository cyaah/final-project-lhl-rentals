class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @booking = @user.bookings.includes(:product)
    @products = @user.products
  end


end
