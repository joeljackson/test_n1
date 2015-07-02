class CitiesController < ApplicationController
  def index1
    render json: City.all.as_json( include: [{transit_routes: {include: :vehicles}}] )
  end

  def index2
    cities = City.includes(transit_routes: :vehicles)
    render json: cities.as_json( include: [{transit_routes: {include: :vehicles}}] )
  end

  def index3
    cities = City.all
    json = cities.map do |city|
      {
        name: city.name,
        transit_routes: city.transit_routes.map do |route|
          {
            name: route.name,
            type: route.route_vehicle,
            vehicles: route.vehicles.map do |vehicle|
              {
                name: vehicle.name,
                size: vehicle.size
              }
            end
          }
        end
      }
    end
    
    render json: json
  end

  def index4
    cities = City.includes(transit_routes: :vehicles)
    json = cities.map do |city|
      {
        name: city.name,
        transit_routes: city.transit_routes.map do |route|
          {
            name: route.name,
            type: route.route_vehicle,
            vehicles: route.vehicles.map do |vehicle|
              {
                name: vehicle.name,
                size: vehicle.size
              }
            end
          }
        end
      }
    end
    
    render json: json
  end

  def index5
    cities = City.includes(transit_routes: :vehicles)
    json = cities.map do |city|
      {
        name: city.name,
        transit_routes: city.transit_routes.train.map do |route|
          {
            name: route.name,
            type: route.route_vehicle,
            vehicles: route.vehicles.large.map do |vehicle|
              {
                name: vehicle.name,
                size: vehicle.size
              }
            end
          }
        end
      }
    end
    
    render json: json
  end

  def index6
    cities = City.includes(train_transit_routes: :large_vehicles)
    json = cities.map do |city|
      {
        name: city.name,
        transit_routes: city.train_transit_routes.map do |route|
          {
            name: route.name,
            type: route.route_vehicle,
            vehicles: route.large_vehicles.map do |vehicle|
              {
                name: vehicle.name,
                size: vehicle.size
              }
            end
          }
        end
      }
    end
    
    render json: json
  end

end
