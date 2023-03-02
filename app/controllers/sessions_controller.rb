class SessionsController < ApplicationController
  def spotify
    redirect_to spotify_auth_path
  end

  def spotify_callback
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    session[:user_id] = User.from_omniauth(auth).id
    redirect_to root_path
  end

  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  private

  def spotify_credentials
    {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      client_secret: ENV['SPOTIFY_CLIENT_SECRET'],
      authorize_url: 'https://accounts.spotify.com/authorize',
      scope: 'user-read-email user-read-private',
      redirect_uri: 'http://localhost:7532/auth/spotify/callback',
      response_type: 'code'
    }
  end
end