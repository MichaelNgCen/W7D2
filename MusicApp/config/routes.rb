Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :bands, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :albums, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :tracks, only: [:new, :index, :show, :create, :edit, :update, :destroy]

end
