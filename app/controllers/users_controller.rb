# class UsersController < ApplicationController
#   def spotify_login
#     code = params[:code]
#     state = params[:state]
  
#     response = RestClient.post('https://accounts.spotify.com/api/token', {
#       grant_type: 'authorization_code',
#       code: code,
#       redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
#       client_id: ENV['SPOTIFY_CLIENT_ID'],
#       client_secret: ENV['SPOTIFY_CLIENT_SECRET']
#     })
  
#     auth_data = JSON.parse(response.body)
  
#     # get user's Spotify ID from the /me endpoint
#     me_response = RestClient.get('https://api.spotify.com/v1/me', {
#       Authorization: "Bearer #{auth_data['access_token']}"
#     })
#     me_data = JSON.parse(me_response.body)
  
#     user = User.new(
#       spotify_id: me_data['id'],
#       email: me_data['email'],
#       username: me_data['display_name'],
#       spotify_access_token: auth_data['access_token'],
#       spotify_refresh_token: auth_data['refresh_token']
#     )
  
#     if user.save!
#       session[:user_id] = user.id
#       redirect_to root_path, notice: 'Successfully logged in with Spotify!'
#     else
#       redirect_to root_path, alert: 'Failed to log in with Spotify.'
#     end
#   end
# end

class UsersController < ApplicationController
  def spotify_login
    code = params[:code]
    state = params[:state]

    request_data = {
      grant_type: 'authorization_code',
      code: code,
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      client_secret: ENV['SPOTIFY_CLIENT_SECRET']
    }
    
    puts request_data

    response = RestClient.post('https://accounts.spotify.com/api/token',
      request_data
    )
  
    auth_data = JSON.parse(response.body)
  
    user = User.new(
      spotify_id: auth_data['id'],
      email: auth_data['email'],
      display_name: auth_data['display_name'],
      image_url: auth_data['images'].first&.[]('url'),
      spotify_access_token: auth_data['access_token'],
      spotify_refresh_token: auth_data['refresh_token']
    )
  
    if user.save!
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in with Spotify!'
    else
      redirect_to root_path, alert: 'Failed to log in with Spotify.'
    end
  end
end
