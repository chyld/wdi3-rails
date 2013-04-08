class Scrape
  attr_accessor :pages, :current_page

  def initialize(pages)
    pages = 1 if pages == 0
    @pages = pages
    @current_page = 0
  end

  def get_data(path)
    if @current_page < @pages
      path = path[1..-1] if path.starts_with? '/'
      url = "https://news.ycombinator.com/#{path}"
      html = HTTParty.get(url)
      doc = Nokogiri::HTML(html)
      links = doc.css('.title > a')
      links[0..-2].each do |link|
        Story.create(:title => link.content, :url => link.get_attribute('href'))
      end

      @current_page += 1
      more = links.last.get_attribute('href')
      get_data(more)
    end
  end
end
