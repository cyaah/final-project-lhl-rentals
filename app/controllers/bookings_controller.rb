class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :returned]

  def shortlist
    # do something here
    @bookings = Booking.all
    @items = Item.all
    if params["select_shortlist"]
      @shortlist = @items.where(id: params["select_shortlist"])
    end
  end

  def showrented
    if params["rented_items"]
      @unreturned_bookings = Booking.where(user: current_user, rent_status: true)
      @returned_bookings = Booking.where(user: current_user, rent_status: false)
    end
  end

  # GET /bookings
  # GET /bookings.json
  def index
    #@bookings = Booking.all
    @bookings = Booking.where(user: current_user, rent_status: true)
    @returned_bookings = Booking.where(user: current_user, rent_status: false)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create

    if params["checked_confirm"]

      #@items = Item.all
      @itemids = Item.where(id: params["checked_confirm"])
      @itemids.each do |itemid|
        @booking = Booking.create(from_date: Date.today + 2, to_date: Date.today + 5, owner_rating: 5, owner_comments: 'No commenets posted', rentor_rating: 5, rentor_comments: 'No comments posted', rent_status: true, user_id: current_user.id, item_id: itemid.id )
      end

    else
      @booking = Booking.new(booking_params)
    end

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end

  end

  # item return PATCH
  def returned
    if @booking.user_id == current_user.id
        @booking.rent_status = !@booking.rent_status

      respond_to do |format|
        if @booking.save
          format.html { redirect_to showrented_bookings_path, notice: 'The rent_status was successfully updated.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:from_date, :to_date, :owner_rating, :owner_comments, :rentor_rating, :rentor_comments, :rent_status, :user_id, :item_id)
    end
end
