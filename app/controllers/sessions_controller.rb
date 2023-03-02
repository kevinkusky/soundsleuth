class SessionsController < ApplicationController
  def spotify
    spotify_auth_path(format: :html)
  end

  def spotify_callback
    puts "spotify_callback called!"
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

  def spotify_auth_params
    {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      response_type: 'code',
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      scope: 'user-read-email user-read-private'
    }
  end
end