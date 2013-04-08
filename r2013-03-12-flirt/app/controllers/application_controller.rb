class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

  private
  def authenticate
    @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
    @subscriber = (@auth.present? && @auth.sub.present?) ? @auth.sub : nil
  end
end
