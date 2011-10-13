require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

require File.expand_path('../lib/models/item', __FILE__)
require File.expand_path('../lib/models/order', __FILE__)

database_urls = {
    :development => 'mysql://root:password@127.0.0.1:3306/beer',
    :production     => 'mysql://root:password@127.0.0.1:3306/beer',
    :test       => 'mysql://root:password@127.0.0.1:3306/beer'
}
set :database, database_urls[settings.environment]



namespace :db do
  desc "Seed the db"
  task :seed  do
    Item.destroy_all
    i1 = Item.create([{ :name => 'Mimosa' , 
    :img => 'awesome.png', 
    :price => '9.70', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i2 = Item.create([{ :name => 'Bloody Mary', 
    :img => 'cali.png', 
    :price => '10.24', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i3 = Item.create([{ :name => 'Coors Light', 
    :img => 'bonfire.png', 
    :price => '5.39', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i4 = Item.create([{ :name => 'Corona', 
    :img => 'sunset.png', 
    :price => '7.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i5 = Item.create([{ :name => 'Firestone', 
    :img => 'sand.png', 
    :price => '7.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i6 = Item.create([{ :name => 'Heineken', 
    :img => 'sand.png', 
    :price => '7.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i7 = Item.create([{ :name => 'Cabernet', 
    :img => 'sand.png', 
    :price => '9.16', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i6 = Item.create([{ :name => 'Chardonnay', 
    :img => 'sand.png', 
    :price => '9.16', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i6 = Item.create([{ :name => 'White Zinfandel', 
    :img => 'sand.png', 
    :price => '9.16', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i6 = Item.create([{ :name => 'Champagne', 
    :img => 'sand.png', 
    :price => '10.78', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i6 = Item.create([{ :name => 'Water Bottle', 
    :img => 'sand.png', 
    :price => '2.16', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);    
  end
end