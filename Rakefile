require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

require File.expand_path('../lib/models/item', __FILE__)
require File.expand_path('../lib/models/order', __FILE__)
require File.expand_path('../lib/models/purchase', __FILE__)
require File.expand_path('../lib/models/location', __FILE__)
require File.expand_path('../lib/models/location_item', __FILE__)

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
    i1 = Item.create([{ :name => 'Awesome Day' , :img => 'awesome.png', :price => '40.00', :desc => "You get TWO of our luxury beach loungers and one large 7.5-foot beach wood post umbrella." }]);
    i2 = Item.create([{ :name => 'California Classic', :img => 'cali.png', :price => '27.00', :desc => "You get one of our luxury beach loungers and one large 7.5-foot wood post beach umbrella." }]);
    i3 = Item.create([{ :name => 'Bonfire', :img => 'bonfire.png', :price => '45.00', :desc => "A bonfire on the beach makes for a romantic evening or an awesome time for a family and friends party.  The 'Bonfire at the Beach!' service includes a completely built bonfire, pre-lit for you minutes before you arrive or left with all the needed tools for you to take on the challenge of lighting the fire.  You get a total of 15 fire logs already primed for burning." }]);
    i4 = Item.create([{ :name => 'Sunset Bonfire', :img => 'sunset.png', :price => '115.00', :desc => "After the sun goes down, a bonfire on the beach makes for a romantic evening or an awesome time for a family and friends party. Beach Butlerz is offering you this most unique beach bonfire experience.  Beach Butlerz will set up a couple of luxury beach loungers, each draped with an incredibly warm blanket, and build a gorgeous bonfire. Beach Butlerz carries the firewood, beach furniture, and warm blankets all out to the beach for you! All you need to do is show up." }]);
    i5 = Item.create([{ :name => 'Sand Toys', :img => 'sand.png', :price => '3.00', :desc => "This sand toy set comes complete with shovels, buckets, and sand shapers. It's perfect for building your own private sand castle." }]);
    
    Location.destroy_all
    avila = Location.create([{ :name => 'Avila Beach'}]);
    olde = Location.create([{ :name => 'Olde Port Beach'}]);
    pismo = Location.create([{ :name => 'Pismo Beach'}]);
    oceano = Location.create([{ :name => 'Oceano Beach'}]);
    cayu = Location.create([{ :name => 'Cayucos Beach'}]);
    
    LocationItem.destroy_all
    #Avila Beach (1,2,5)
    LocationItem.create([{ :item_id => i1[0].id, :location_id => avila[0].id}]);
    LocationItem.create([{ :item_id => i2[0].id, :location_id => avila[0].id}]);
    LocationItem.create([{ :item_id => i5[0].id, :location_id => avila[0].id}]);
    
    #Olde Port Beach (1,2,3,4,5)
    LocationItem.create([{ :item_id => i1[0].id, :location_id => olde[0].id}]);
    LocationItem.create([{ :item_id => i2[0].id, :location_id => olde[0].id}]);
    LocationItem.create([{ :item_id => i3[0].id, :location_id => olde[0].id}]);
    LocationItem.create([{ :item_id => i4[0].id, :location_id => olde[0].id}]);
    LocationItem.create([{ :item_id => i5[0].id, :location_id => olde[0].id}]);
    
    #Pismo Beach (1,2,5)
    LocationItem.create([{ :item_id => i1[0].id, :location_id => pismo[0].id}]);
    LocationItem.create([{ :item_id => i2[0].id, :location_id => pismo[0].id}]);
    LocationItem.create([{ :item_id => i5[0].id, :location_id => pismo[0].id}]);
    
    #Oceano Beach (1,2,3,4,5)
    LocationItem.create([{ :item_id => i1[0].id, :location_id => oceano[0].id}]);
    LocationItem.create([{ :item_id => i2[0].id, :location_id => oceano[0].id}]);
    LocationItem.create([{ :item_id => i3[0].id, :location_id => oceano[0].id}]);
    LocationItem.create([{ :item_id => i4[0].id, :location_id => oceano[0].id}]);
    LocationItem.create([{ :item_id => i5[0].id, :location_id => oceano[0].id}]);
    
    #Cayucos Beach (1,2,3,4,5)
    LocationItem.create([{ :item_id => i1[0].id, :location_id => cayu[0].id}]);
    LocationItem.create([{ :item_id => i2[0].id, :location_id => cayu[0].id}]);
    LocationItem.create([{ :item_id => i3[0].id, :location_id => cayu[0].id}]);
    LocationItem.create([{ :item_id => i4[0].id, :location_id => cayu[0].id}]);
    LocationItem.create([{ :item_id => i5[0].id, :location_id => cayu[0].id}]);
    
  end
end