class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  private
  def authenticate
    @auth = User.find(session[:user_id]) if session[:user_id].present?
  end
end
