# == Schema Information
#
# Table name: priorities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)      default("#ffffff")
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  value      :integer          default(1)
#

class Priority < ActiveRecord::Base
  attr_accessible :name, :color, :value
  belongs_to :user, :inverse_of => :priorities
  has_many :tasks, :inverse_of => :priority

  def swap_higher(user)
    higher = user.priorities.where('value > ?', self.value).order('value ASC').first

    if higher.present?
      temp = self.value
      self.value = higher.value
      higher.value = temp
      self.save
      higher.save
      [self, higher]
    else
      [self]
    end
  end

  def swap_lower(user)
    lower = user.priorities.where('value < ?', self.value).order('value DESC').first

    if lower.present?
      temp = self.value
      self.value = lower.value
      lower.value = temp
      self.save
      lower.save
      [self, lower]
    else
      [self]
    end
  end
end
