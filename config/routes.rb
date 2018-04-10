Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},

             # To overide update profile without have to input current password
             controllers: {registrations: 'registrations'}
  resources :users, only: [:show]
  resources :products, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
    end
    resources :bookings, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]

end
