class TransitRoute < ActiveRecord::Base
  has_many :vehicles
  has_many :large_vehicles, -> { where( size: 'Large')}, class: Vehicle

  belongs_to :city

  scope :train, -> { where(route_vehicle: 'Train') }
  scope :bus, -> { where(route_vehicle: 'Bus') }
end
