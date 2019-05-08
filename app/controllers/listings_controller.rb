class ListingsController < ApplicationController
  def index
    listings = Listing.all
    render json: { listings: listings }, status: :ok
  end

  def show
    listing = Listing.find_by_id(params[:id])
    render json: listing, status: :ok
  end

  def create
    listing = Listing.create(listing_params)
    render json: listing, status: :created
  end

  def update
    listing = Listing.find_by_id(params[:id])
    listing.update(listing_params)
    render json: listing, status: :ok
  end

  def destroy
    listing = Listing.find_by_id(params[:id])
    listing.destroy

    render json: listing, status: :ok
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
