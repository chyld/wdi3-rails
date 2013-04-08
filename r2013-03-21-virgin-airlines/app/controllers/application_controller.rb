class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

  private
  def authenticate
    @auth = if session[:user_id].present?
              User.find(session[:user_id])
            else
              nil
            end
  end
end
