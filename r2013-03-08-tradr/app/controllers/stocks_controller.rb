class StocksController < ApplicationController
  before_filter :only_authenticated_users

  def index
  end

  def new
    @stock = Stock.new
  end

  def create
    symbol = params[:stock][:symbol]
    shares = params[:stock][:shares].to_i
    @auth.purchase(symbol, shares) if @auth.has_enough_money?(symbol, shares)
  end

  def quotes
    render :json => @auth.stocks.map{|s| {:symbol => s.symbol, :shares => s.shares, :purchase_price => s.purchase_price.to_f, :quote => Stock.quote(s.symbol), :time => Time.now}}
  end

  private
  def only_authenticated_users
    redirect_to(root_path) if @auth.nil?
  end
end
