class ApplicationController < ActionController::Base
  NotAuthenticated = Class.new(StandardError)

  rescue_from NotAuthenticated do
    redirect_to root_path, notice: "Please sign in via Github"
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
end
