class Listing < ApplicationRecord
  has_many :bookings
  has_many :reservations

  has_many :missions
  has_many :checkout_checkins
  has_many :first_checkins
  has_many :last_checkouts

  def has_a_cleaning_mission_at?(date)
    last_checkouts&.pluck(:mission_date)&.any? do |last_checkout_date|
      last_checkout_date.to_date == date.to_date
    end
  end
end
