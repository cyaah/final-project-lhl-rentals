Rails.application.routes.draw do
  root 'pages#index'

  resources :bookings
  resources :products, only: [:index, :show]
  resources :users, only: [:show]
  resources :categories, only: [:index, :show]


  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},

             # To overide update profile without have to input current password
             controllers: {registrations: 'registrations'}

end
