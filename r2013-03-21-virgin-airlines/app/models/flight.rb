# == Schema Information
#
# Table name: flights
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  depart      :string(255)
#  arrive      :string(255)
#  departure   :date
#  airplane_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Flight < ActiveRecord::Base
  attr_accessible :name, :depart, :arrive, :departure, :airplane_id
  belongs_to :airplane
  has_many :reservations
  has_many :users, :through => :reservations

  scope :search, lambda {|d, a| where(depart: d.upcase, arrive: a.upcase)}
  scope :sorted, order(:departure).order(:depart)

  def purchase(user, col, row)
    if !self.is_reserved?(col, row)
      self.reservations << Reservation.create(row: row, col: col, flight_id: self.id, user_id: user.id)
    end
  end

  def manifest(col, row)
    reservation = self.reservations.where(row: row, col: col).first
    reservation.user.email if reservation.present?
  end

  def is_reserved?(col, row)
    Airplane.seat_name(col, row).in?(self.taken)
  end

  def taken
    self.reservations.map{|r| Airplane.seat_name(r.col, r.row)}
  end

  def reserved
    self.reservations.count
  end

  def available
    self.airplane.seats - self.reserved
  end
end
