Rails.application.routes.draw do
  resources :listings

  root :to => 'pages#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",:registrations => 'registrations' }

  resources :users, only: [:show]

  resources :photos, only: [:create, :destroy] do
    collection do
      get :list 
    end
  end

  resources :listings do
    resources :reviews, only: [:create, :destroy]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage_listing_basics'
  get 'manage-listing/:id/hyouka' => 'listings#hyouka', as: 'manage_listing_hyouka'
  get 'manage-listing/:id/country' => 'listings#country', as: 'manage_listing_country'
  get 'manage-listing/:id/photos' => 'listings#photos', as: 'manage_listing_photos'
  get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage_listing_publish'
  get 'manage-listing/:id/address' => 'listings#address', as: 'manage_listing_address'


  get '/not_checked' => 'listings#not_checked'

  get '/search' => 'pages#search'

  get '/namesearch' => 'namesearch#search'

end
