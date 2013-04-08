class UsersController < ApplicationController
  def index
    @users = User.order(:email)
  end
  def new
    @user = User.new
  end
  def create
    User.create(params[:user])
    @users = User.order(:email)

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.js
    end
  end
end
