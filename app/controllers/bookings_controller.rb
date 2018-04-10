class BookingsController < ApplicationController

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

    flash[:notice] = "Booked successfully!"
    redirect_to product

  end

  private
    def booking_params
      params.require(:booking).permit(:from_date, :to_date)
    end

end
