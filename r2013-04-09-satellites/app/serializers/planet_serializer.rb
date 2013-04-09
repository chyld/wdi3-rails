class PlanetSerializer < ActiveModel::Serializer
  attributes :id, :name, :image
  has_many :satellites
  embed :ids, include: true
end
