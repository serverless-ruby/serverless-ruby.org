class ApplicationController < ActionController::Base
  NotAuthenticated = Class.new(StandardError)
  NotAuthorized = Class.new(StandardError)

  rescue_from NotAuthenticated do
    redirect_to '/auth/github', notice: "Please sign in via Github"
  end

  rescue_from NotAuthorized do
    redirect_to root_path, notice: "You are not authorized to perform this action"
  end

  def authenticate
    raise NotAuthenticated unless current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end
  helper_method :current_user
end
