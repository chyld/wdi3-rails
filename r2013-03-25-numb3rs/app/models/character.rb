# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  symbol     :string(255)
#  hex        :string(255)
#  code_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ActiveRecord::Base
  attr_accessible :symbol, :hex
  belongs_to :code
end
