Rails.application.routes.draw do
  devise_for :users
  root to: 'experiences#index'
  resources :experiences do
    resources :bookings
  end
  get 'my_experiences', to:'experiences#my_experiences'
end
