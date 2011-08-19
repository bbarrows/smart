class LocationsItems < ActiveRecord::Migration
  def self.up
    create_table :locations_items do |t|
      t.integer :item_id
      t.integer :location_id
      t.timestamps
    end
    #add_index :beer, :url
  end

  def self.down
    drop_table :locations_items
  end
end
