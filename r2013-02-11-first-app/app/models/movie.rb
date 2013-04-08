class Movie < ActiveRecord::Base
  attr_accessible :description, :is_in_theatres, :rating, :released, :title
end
