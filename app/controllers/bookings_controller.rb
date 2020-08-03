class BookingsController < ApplicationController
  before_action :find_experience

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
    if @booking.save
      # set booked to true?
      redirect_to experiences_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end
end
