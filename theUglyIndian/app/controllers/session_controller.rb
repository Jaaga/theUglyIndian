class SessionController < ApplicationController
	def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user.id.present?
      session[:user_id] = user.id
      render json: user
    else
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
