class SessionsController < ApplicationController
  def create
    if user = User.find_via_omniauth(auth['uid'])
      notice_msg = 'Signed in successfully'
    else
      user = User.create_with_omniauth(auth)
      notice_msg = 'Thank you ! You are now registered user.'
    end
    reset_session
    session[:user_id] = user.github_uid
    redirect_to root_path, :notice => notice_msg
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :notice => "Authentication error: #{params[:message].humanize}"
  end
end
