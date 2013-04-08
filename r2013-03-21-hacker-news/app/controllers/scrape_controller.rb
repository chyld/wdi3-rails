class ScrapeController < ApplicationController
  def scrape
    pages = params[:pages].to_i
    Story.delete_all
    scraper = Scrape.new(pages)
    scraper.get_data('news')
    @stories = Story.all
  end
end
