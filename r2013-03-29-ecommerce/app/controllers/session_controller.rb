class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      Notifications.login_message(user).deliver
      session[:user_id] = user.id
      @products = Product.filtered
    else
      session[:user_id] = nil
    end

    authenticate
  end

  def destroy
    session[:user_id] = nil
    authenticate
  end
end
