class MissionsController < ApplicationController
  before_action :parent_listing

  def index
    missions = if @listing.nil?
      Mission.all
    else
      @listing.missions
    end

    render json: {
      missions: missions.as_json(methods: :mission_type)
    }, status: :ok
  end

  def show
    mission = Mission.find_by_id(params[:id])
    render json: mission.as_json(methods: :mission_type), status: :ok
  end

  private

  # check if is a sub-missions of other object
  def parent_listing
    if params[:reservation_id] || params[:booking_id]
      reservation = Reservation.includes(:listing).find_by_id(params[:reservation_id])
      booking = Booking.includes(:listing).find_by_id(params[:booking_id])
      parent = reservation || booking

      @listing = parent&.listing
    elsif params[:listing_id]
      @listing = Listing.find_by_id(params[:listing_id])
    end
  end
end
