class CreateOrder < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.decimal :total, :precision => 6, :scale => 2
      t.string  :order_json
      t.string  :note
      t.string  :status
      t.string  :code
      t.integer :user_id_fullfilled
      t.string  :email
      t.string  :name
      t.string  :last_four
      
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
