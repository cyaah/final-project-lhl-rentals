class PagesController < ApplicationController
  def index
    @categories = Product.category.all
  end
end
