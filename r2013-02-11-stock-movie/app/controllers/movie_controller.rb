class MovieController < ApplicationController
  def new
  end

  def poster
    title = params[:title].gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{title}"
    html = HTTParty.get(url)
    @hash = JSON(html)
  end
end
