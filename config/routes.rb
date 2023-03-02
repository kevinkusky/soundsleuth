# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        static_pages#root
#              spotify_auth GET  /auth/spotify(.:format)                                                                  sessions#spotify
#     auth_spotify_callback GET  /auth/spotify/callback(.:format)                                                         sessions#spotify_callback
#             spotify_login POST /users/spotify_login(.:format)                                                           users#spotify_login
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root 'static_pages#root'

  get '/auth/spotify', to: 'sessions#spotify', as: 'spotify_auth'
  get '/auth/spotify/callback', to: 'sessions#spotify_callback'

  post '/users/spotify_login', to: 'users#spotify_login', as: 'spotify_login'
end
