# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  course       :string(255)
#  cooktime     :integer
#  servingsize  :integer
#  instructions :text
#  image        :text
#  book_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Recipe < ActiveRecord::Base
  attr_accessible :name, :course, :cooktime, :servingsize, :instructions, :image, :book_id, :ingredient_ids
  belongs_to :book
  has_and_belongs_to_many :ingredients
end
