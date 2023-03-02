class UsersController < ApplicationController
  def spotify_login
    code = params[:code]
    state = params[:state]
  
    response = RestClient.post('https://accounts.spotify.com/api/token', {
      grant_type: 'authorization_code',
      code: code,
      redirect_uri: ENV['redirect_uri'],
      client_id: ENV['client_id'],
      client_secret: ENV['client_secret']
    })
  
    auth_data = JSON.parse(response.body)
  
    # get user's Spotify ID from the /me endpoint
    me_response = RestClient.get('https://api.spotify.com/v1/me', {
      Authorization: "Bearer #{auth_data['access_token']}"
    })
    me_data = JSON.parse(me_response.body)
  
    user = User.new(
      spotify_id: me_data['id'],
      email: me_data['email'],
      username: me_data['display_name'],
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
