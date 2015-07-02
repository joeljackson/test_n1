class CreateTransitRoutes < ActiveRecord::Migration
  def change
    create_table :transit_routes do |t|
      t.string :name
      t.string :route_vehicle
      t.integer :city_id

      t.timestamps
    end
  end
end
