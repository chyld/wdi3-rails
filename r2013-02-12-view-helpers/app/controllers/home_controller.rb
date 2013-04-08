class HomeController < ApplicationController
  def home
  end
  def numbers
    @amount = 234
    @large_number = 43434532452323
    @phone = 2126573456
  end
  def text
    @numbers = (1..20).to_a
    @person_count1 = 1
    @person_count2 = 2
    @story = "a very long long time ago in a place far far away"
  end
  def assets
  end
  def url
  end
end
