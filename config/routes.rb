Rails.application.routes.draw do
  root 'pages#index'



  resources :products, only: [:index, :show] do
    resources :reviews
  end

  resources :users, only: [:show]
  resources :categories, only: [:index, :show]
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             # To overide update profile without have to input current password
             controllers: {registrations: 'registrations'}

  resources :products, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
    end
    resources :bookings, only: [:create, :destroy]
  end

end
