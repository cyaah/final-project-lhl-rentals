class PagesController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def booking_confirmation
  end  

end
