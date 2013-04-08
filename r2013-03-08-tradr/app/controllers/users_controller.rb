class UsersController < ApplicationController
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    @users = User.order(:email)
  end
end
