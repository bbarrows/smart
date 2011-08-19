class CreatePurchase < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :ccnum
      t.string :month
      t.string :year
      t.string :confirmation
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
