class UsersController < ApplicationController

  def show

    @user = User.find(params[:id])
    @booking = @user.bookings.includes(:product)
    @products = @user.products

    if current_user.stripe_id.blank?
      @user = User.find(params[:id])
      @booking = @user.bookings
      @product = @user.products
      @card = {}
    else
      @user = User.find(params[:id])
      @booking = @user.bookings
      @product = @user.products
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      @card = customer.sources.retrieve(customer.sources.data[0].id)
    end
  end

  def payment
  end

  def payout
    if !current_user.merchant_id.blank?
      account = Stripe::Account.retrieve(current_user.merchant_id)
      @login_link = account.login_links.create()
    end
  end

  def add_card
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        email: current_user.email
      )
      current_user.stripe_id = customer.id
      current_user.save

      # Add Credit Card to Stripe
      # customer.sources.create(source: params[:stripeToken])
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      # customer.source = params[:stripeToken]
      # customer.save
    end

      month, year = params[:expiry].split(/ \/ /)
      new_token = Stripe::Token.create(:card => {
        :number => params[:number],
        :exp_month => month,
        :exp_year => year,
        :cvc => params[:cvv]
        })
      customer.sources.create(source: new_token.id)

      flash[:notice] = "Your card is saved."
      redirect_to payment_method_path
      rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to payment_method_path
      end

      #REVIEWS

      def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
        @review.user  = current_user

        if @review.save
          redirect_to product_path(@product)
        else
          redirect_to product_path(@product)
        end
      end

      def destroy
        @product = Product.find(params[:product_id])
        @review = @product.reviews.find(params[:id])
        @review.destroy
        redirect_to product_path(@product)
      end

      private

      def review_params
        params.require(:review).permit(
          :product_id,
          :description,
          :rating
        )
      end



  end
