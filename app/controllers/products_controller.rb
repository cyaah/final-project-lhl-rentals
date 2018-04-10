class ProductsController < ApplicationController

  def index
		@product = Product.all
	end

	def show
		 @product = Product.find params[:id]
	end

	def new
    @product = Product.new
	end

	def create
		@product = Product.new(product_params)
	end

	 def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :image,
      :price
    )
  end
end
