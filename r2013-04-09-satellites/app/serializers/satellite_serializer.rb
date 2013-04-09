class SatelliteSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :period, :distance, :diameter
end
