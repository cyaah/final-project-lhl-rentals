class BookingMailer < ApplicationMailer

  def booking_email(user)
    @user = user
   
    mail(to: @user.email, subject: 'Someone has booked your product')
  end
end
