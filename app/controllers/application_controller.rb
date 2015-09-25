class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_admin_logged_in!
    authenticate_admin!
  end

  def check_user_logged_in!
    authenticate_user! unless admin_signed_in?
  end
end
