Rails.application.routes.draw do
  resources :listings, except: %i[new edit]
  resources :bookings, except: %i[new edit]
  resources :reservations, except: %i[new edit]
end
