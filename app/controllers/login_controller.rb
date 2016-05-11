class LoginController < ApplicationController
  def new 
  end

  def create
    user = User.find_by_email(params[:email].to_s)
    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to "/tasks"
    else
      flash.alert = "Invalid e-mail or password."
      render :new
    end
  end
end
