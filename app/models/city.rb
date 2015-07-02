class City < ActiveRecord::Base
  has_many :transit_routes

  has_many :train_transit_routes, -> { train }, class: TransitRoute
end
