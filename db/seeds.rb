# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
input = eval(File.read(Rails.root.join('db_seeds', 'backend_test.rb')))

input[:listings].each do |listing|
  Listing.create(listing.except(:id))
end

input[:bookings].each do |booking|
  booking_obj = Booking.create(booking.except(:id))
end

input[:reservations].each do |reservation|
  reservation_obj = Reservation.create(reservation.except(:id))
end

