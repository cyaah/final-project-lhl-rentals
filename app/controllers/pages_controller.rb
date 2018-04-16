class PagesController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def booking_confirmation
  end  

  
	def search
		if params[:search].blank?
			redirect_to(root_path, alert: "Empty field!") and return
		else
			@parameter = params[:search].downcase
			@results = Product.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
		end
	end

end
