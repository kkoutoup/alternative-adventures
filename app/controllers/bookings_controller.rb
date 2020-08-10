class BookingsController < ApplicationController
  before_action :find_experience, except: [:index]

  def index
    @bookings = Booking.where(user_id: current_user.id).order(id: :desc)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
    if @booking.save
      @booking.update_attributes(booked: true)
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit; end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to experience_path(@experience)
    else
      render :edit
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
