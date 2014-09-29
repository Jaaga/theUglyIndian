class SessionController < ApplicationController
	skip_before_filter :verify_authenticity_token

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

  def auth
  	@auth = params[:Authorization]
  	render json: @auth
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
