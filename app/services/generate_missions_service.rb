# Service that generates missions from Listing/Booking/Reservation models
class GenerateMissionsService
  def initialize(booking, reservation = nil)
    @booking = booking
    @reservation = reservation
  end

  def call
    # create missions from booking
    create_missions_from_booking(@booking) unless @booking.nil?

    # Cleaning mission called checkout_checkin at the end of each reservation
    #   UNLESS there is already a last_checkout at the same date
    return if @reservatio.nil?
    return if @reservation&.listing&.has_a_cleaning_mission_at?(@reservation.end_date)

    # create missions from reservation
    create_missions_from_reservation(@reservation)
  end

  private

  def create_missions_from_booking(booking)
    # Cleaning mission called first_checkin before the owner comes back
    FirstCheckin.create(
      listing_id: booking.listing_id,
      price: Mission.get_price_by_type('FirstCheckin'),
      mission_date: booking.start_date
    )
    # Cleaning mission called last_checkout before the owner comes back
    LastCheckout.create(
      listing_id: booking.listing_id,
      price: Mission.get_price_by_type('LastCheckout'),
      mission_date: booking.end_date
    )
  end

  def create_missions_from_reservation(reservation)
    CheckoutCheckin.create(
      listing_id: reservation.listing_id,
      price: Mission.get_price_by_type('CheckoutCheckin'),
      mission_date: reservation.end_date
    )
  end
end