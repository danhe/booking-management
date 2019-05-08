class ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: { reservations: reservations }, status: :ok
  end

  def show
    reservation = Reservation.find_by_id(params[:id])
    render json: reservation, status: :ok
  end

  def create
    reservation = Reservation.create(reservation_params)
    render json: reservation, status: :created
  end

  def update
    reservation = Reservation.find_by_id(params[:id])
    reservation.update(reservation_params)
    render json: reservation, status: :ok
  end

  def destroy
    reservation = Reservation.find_by_id(params[:id])
    reservation.destroy

    render json: reservation, status: :ok
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :listing_id,
      :start_date,
      :end_date,
      start_date: DateTime,
      end_date: DateTime
    )
  end
end
