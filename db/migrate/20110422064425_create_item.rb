class CreateItem < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :img
      t.text :desc
      t.decimal :price, :precision => 6, :scale => 2

      t.timestamps
    end
    #add_index :beer, :url
  end

  def self.down
    drop_table :items
  end
end
