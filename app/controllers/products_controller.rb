class ProductsController < ApplicationController

  def index
		# @product = Product.all
	end

	def show
		 @product = Product.find params[:id]
		 puts @product.inspect

	end

	def new
    	@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.user = current_user
		
		if @product.save
			redirect_to ('/')
		end

	end

	def edit 
		@product = Product.find params[:id]
		
	end

	def update 
		@product = Product.find params[:id]
		# @product.update(name: params[:name], description: params[:description], category: params[:category], price: params[:price], image: params[:image])
		@product.name = product_params[:name]
		@product.description = product_params[:description]
		@product.category_id = product_params[:category_id]
		@product.price = product_params[:price]
		@product.image = product_params[:image]
		if @product.save 
			redirect_to product_path(@product)	
		end
	end



	def destroy
		@product = Product.find params[:id]
		@user = @product.user
		@product.destroy
		redirect_to @user, notice: "Product deleted"	
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
