class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def require_login
    unless current_user
      redirect_to root_path, alert: 'You must be logged in to access this page'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
