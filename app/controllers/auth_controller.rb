class AuthController < ApplicationController
  def spotify
    redirect_to '/auth/spotify/callback'
  end

  def spotify_callback
    request_data = {
      grant_type: 'authorization_code',
      code: params[:code],
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      client_secret: ENV['SPOTIFY_CLIENT_SECRET']
    }

    puts request_data
    
    # Get the access token and other details from Spotify
    begin
      response = RestClient.post('https://accounts.spotify.com/api/token', request_data)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end

    puts response.body
  
    # Parse the response and extract the access token
    auth_params = JSON.parse(response.body)
    access_token = auth_params['access_token']
  
    # Use the access token to get the user's details from Spotify
    user_info_response = RestClient.get('https://api.spotify.com/v1/me', {
      Authorization: "Bearer #{access_token}"
    })
    user_info = JSON.parse(user_info_response.body)
  
    # Create a new user record in the database or update an existing one
    user = User.find_or_initialize_by(spotify_id: user_info['id'])
    user.update!(
      email: user_info['email'],
      display_name: user_info['display_name'],
      image_url: user_info['images'][0]['url'],
      spotify_access_token: access_token,
      spotify_refresh_token: auth_params['refresh_token']
    )
  
    # Set the user ID in the session and redirect to the game page
    session[:user_id] = user.id
    redirect_to game_path
  end
end