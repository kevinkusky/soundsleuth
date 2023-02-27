Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults { format: :json } do
    resource :session, only: [:create, :destroy, :show]
    resource :player, only: [:create]
  end

  root 'pages#root'

  get '/auth/:provider/callback', to: 'sessions#create'
end
