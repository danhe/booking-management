Rails.application.routes.draw do
  resources :listings, except: %i[new edit] do
    resources :missions, only: %i[index show]
  end

  resources :bookings, except: %i[new edit] do
    resources :missions, only: %i[index show]
  end

  resources :reservations, except: %i[new edit] do
    resources :missions, only: %i[index show]
  end

  resources :missions, only: %i[index show]
end
