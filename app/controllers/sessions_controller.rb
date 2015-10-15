class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by email: email
    if user.present? && user.authenticate(password)
      sign_in user
      redirect_to root_path, notice: "You are signed in!"
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Later!"
  end
end
