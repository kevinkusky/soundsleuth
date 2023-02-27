class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    session[:user_id] = User.from_omniauth(auth).id
    redirect_to root_path
  end
end