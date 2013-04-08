class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

  private
  def authenticate
    if session[:user_id].present?
      @auth = User.find(session[:user_id])
    else
      @auth = nil
    end
  end
end
