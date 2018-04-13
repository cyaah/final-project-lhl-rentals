Rails.application.routes.draw do

  # ROOT
  root 'pages#index'

  # PRODUCTS
  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews
  end
get '/search' => 'products#search', :as => 'search_page'
  # CATEGORIES
  resources :categories, only: [:index, :show]

  # USER - USER DEVISE GEM
  resources :users, only: [:show]
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  # TO OVERIDE UPDATE PROFILE WITHOUT HAVE TO INPUT CURRENT PASSWORD
  controllers: {registrations: 'registrations'}



  #BOOKING
  resources :products, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
    end
    resources :bookings, only: [:create, :destroy]
  end


  # STRIPE
  get '/payment_method' => "users#payment"
  post '/add_card' => "users#add_card"





end
