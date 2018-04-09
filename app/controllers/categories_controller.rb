class CategoriesController < ApplicationController

	def index 
		@category = Category.order(id: :desc).all
	
	end

	def show
		@category = Category.find(params[:id])
	end

end
