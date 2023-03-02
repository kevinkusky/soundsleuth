Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/spotify', to: 'sessions#spotify', via: [:get, :post]
  get '/auth/spotify/callback', to: 'sessions#spotify_callback'
  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy, :show]
    resource :player, only: [:create]
  end

  root 'static_pages#root'
end
