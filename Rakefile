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
    i1 = Item.create([{ :name => 'Awesome Day at the Beach' , :img => 'awesome.png', :price => '40.00', :desc => "You get TWO of our luxury beach loungers and one large 7.5-foot beach wood post umbrella.  The beach loungers are made of oak wood and wrapped in sturdy, yet soft, marine grade cotton material. These loungers are adjustable and some are fully reclinable (must request these). The beach umbrella is made with Sunbrella material, which is tested to block 95% of the sun\'s ultra violet rays for your protection. An 18"" round heavy duty plastic table with four drink holders surrounds the center of the umbrella. <br /> Beach Butlerz carries everything out to the beach for you so that you won\'t have to be the pack mule.  This combo also includes two - single use sunscreen packets formulated to be marine friendly and skin safe, a thorough sand raking of a 200 square foot area around your loungers, removal of any trash and seaweed found at your location, and an authentic Beach Butlerz beach ball. Yours to keep!<br /> Rent this combo and you'll not only be experiencing the California Riviera like you should, but you will also LOOK like you're relaxing on the California Riviera. It's smothered in style and just completely AWESOME!" }]);
    i2 = Item.create([{ :name => 'California Classic Combo', :img => 'cali.png', :price => '27.00', :desc => "You get one of our luxury beach loungers and one large 7.5-foot wood post beach umbrella.  The beach lounger is made of oak wood and wrapped in sturdy, yet soft, marine grade cotton material. The lounger is adjustable and some are fully reclinable (must request these). The beach umbrella is made with Sunbrella material, which is tested to block 95% of the sun\'s ultra violet rays for your protection. An 18"" round heavy duty plastic table  with four drink holders surrounds the center of the umbrella. <br />     Beach Butlerz carries everything out to the beach for you so that you won\'t have to be the pack mule.  This combo also includes a single use sunscreen packet formulated to be marine friendly and skin safe, a thorough sand raking of a 200 square foot area around your loungers, removal of any trash and seaweed found at your location, and an authentic Beach Butlerz beach ball - Yours to keep!<br /> This combo is a definite must for one wanting to relax California style." }]);
    i3 = Item.create([{ :name => 'Bonfire', :img => 'bonfire.png', :price => '45.00', :desc => "A bonfire on the beach makes for a romantic evening or an awesome time for a family and friends party.  The 'Bonfire at the Beach!' service includes a completely built bonfire, pre-lit for you minutes before you arrive or left with all the needed tools for you to take on the challenge of lighting the fire.  You get a total of 15 fire logs already primed for burning. \"That was easy.\" <br />The Minor Details: <br /> A bonfire will be set up at a specific time. Please indicate the time and date requested. The Beach Butlerz staff isn\'t allowed to leave a fire unguarded therefore, if you are a no show after 30 minutes, the bonfire will be disassembled and the fire put out for safety reasons." }]);
    i4 = Item.create([{ :name => 'Sunset Beach Bonfire', :img => 'sunset.png', :price => '50.00', :desc => "A bonfire on the beach makes for a romantic evening or an awesome time for a family and friends party.  The 'Bonfire at the Beach!' service includes a completely built bonfire, pre-lit for you minutes before you arrive or left with all the needed tools for you to take on the challenge of lighting the fire.  You get a total of 15 fire logs already primed for burning. \"That was easy.\" <br />The Minor Details: <br /> A bonfire will be set up at a specific time. Please indicate the time and date requested. The Beach Butlerz staff isn\'t allowed to leave a fire unguarded therefore, if you are a no show after 30 minutes, the bonfire will be disassembled and the fire put out for safety reasons." }]);
    i5 = Item.create([{ :name => 'Sand Toys', :img => 'sand.png', :price => '3.00', :desc => "This sand toy set comes complete with shovels, buckets, and sand shapers. It's perfect for building your own private sand castle. The kids will never forget this great day and no messy storage for you to take home!" }]);
    
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