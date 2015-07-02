class Vehicle < ActiveRecord::Base
  belongs_to :transit_route

  scope :large, -> { where(size: 'Large') }
  scope :medium, -> { where(size: 'Medium') }
  scope :small, -> { where(size: 'Small') }
end
