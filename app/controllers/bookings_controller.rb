class BookingsController < ApplicationController
  protect_from_forgery prepend:
  true
  def create
    product = Product.find(params[:product_id])

    from_date = Date.parse(booking_params[:from_date])
    to_date = Date.parse(booking_params[:to_date])
    days = (to_date - from_date).to_int + 1


    @booking = current_user.bookings.build(booking_params)
    @booking.user_id = current_user.id
    @booking.product = product
    @booking.price = product.price
    @booking.total = product.price * days
    @booking.save

    if @booking.save
      flash[:notice] = "Booked successfully!"
      redirect_to :action=>"show",:controller=>"users", id: current_user.id
    else(@booking.nil?)
      flash[:notice] = "Please sign in!"
      redirect_to :action=>"show",:controller=>"products", id: product.id
    end

  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      240 * 100, # in cents
      description: "Thanks for renting with us",
      currency:    'cad'
    )

    flash[:notice] = "Thanks for your payment."
    redirect_to :action=>"show",:controller=>"users", id: current_user.id
  end

  def destroy
    
		@booking = Booking.find params [:id]
    @user = @booking.user
		@booking.destroy
		redirect_to @user, notice: "Booking has been canceled"
	end

  private
    def booking_params
      params.require(:booking).permit(:from_date, :to_date)
    end

end
