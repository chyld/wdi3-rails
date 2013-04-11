class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  private
  def authenticate
    if session[:username].present?
      @auth = User.where(username: session[:username]).first
    else
      @auth = nil
    end
  end
end
