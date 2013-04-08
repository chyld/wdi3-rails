class SessionController < ApplicationController
  def new
  end
  def create
    user = User.where(:name => params[:username]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      flash[:notice] = 'Incorrect login, try again.'
      redirect_to(login_path)
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
