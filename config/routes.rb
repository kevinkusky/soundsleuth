# == Route Map
#
#                     Prefix Verb   URI Pattern                                                                              Controller#Action
#               auth_spotify GET    /auth/spotify(.:format)                                                                  sessions#spotify
#      auth_spotify_callback GET    /auth/spotify/callback(.:format)                                                         sessions#spotify_callback
#                            GET    /auth/:provider/callback(.:format)                                                       sessions#create
#          auth_spotify_user GET    /auth/spotify/user(.:format)                                                             users#spotify_auth
# auth_spotify_user_callback GET    /auth/spotify/user/callback(.:format)                                                    users#spotify_callback
#                api_session GET    /api/session(.:format)                                                                   api/sessions#show {:format=>:json}
#                            DELETE /api/session(.:format)                                                                   api/sessions#destroy {:format=>:json}
#                            POST   /api/session(.:format)                                                                   api/sessions#create {:format=>:json}
#                 api_player POST   /api/player(.:format)                                                                    api/players#create {:format=>:json}
#                       root GET    /                                                                                        static_pages#root
#         rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#  rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#         rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#  update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#       rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/spotify', to: 'sessions#spotify', via: [:get, :post]
  get '/auth/spotify/callback', to: 'sessions#spotify_callback'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/spotify/user', to: 'users#spotify_auth'
  get '/auth/spotify/user/callback', to: 'users#spotify_callback'

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy, :show]
    resource :player, only: [:create]
  end

  root 'static_pages#root'
end
