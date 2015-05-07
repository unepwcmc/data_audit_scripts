class CreateNetworkLocations < ActiveRecord::Migration
  def change
    create_table :network_locations do |t|
      t.string :path
      t.integer :drive_id

      t.timestamps
    end
  end
end
