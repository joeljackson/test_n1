class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :size
      t.integer :transit_route_id

      t.timestamps
    end
  end
end
