class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    render json: { bookings: bookings }, status: :ok
  end

  def show
    booking = Booking.find_by_id(params[:id])
    render json: booking, status: :ok
  end

  def create
    booking = Booking.create(booking_params)
    render json: booking, status: :created
  end

  def update
    booking = Booking.find_by_id(params[:id])
    booking.update(booking_params)
    render json: booking, status: :ok
  end

  def destroy
    booking = Booking.find_by_id(params[:id])
    booking.destroy

    render json: booking, status: :ok
  end

  private

  def booking_params
    params.require(:booking).permit(
      :listing_id,
      :start_date,
      :end_date,
      start_date: DateTime,
      end_date: DateTime
    )
  end
end
