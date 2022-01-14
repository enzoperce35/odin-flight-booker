class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking_choice = Flight.find(params[:booking_option])
    passenger_count = params[:num_tickets].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(passenger_params)

    if @booking.save
      flash[:notice] = "Booking created successfully."
      PassengerMailer.confirmation_email(@booking).deliver_now
      redirect_to @booking
    else
      flash[:alert] = "Sorry, there was a problem creating your booking."
      render :new
    end
  end

  def show
  end
end
