class CreateOrder < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :item_id
      t.integer :purchase_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
