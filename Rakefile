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
    i1 = Item.create([{ :name => 'Coors Light' , 
    :img => 'awesome.png', 
    :price => '4.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i2 = Item.create([{ :name => 'Budweiser', 
    :img => 'cali.png', 
    :price => '7.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i3 = Item.create([{ :name => 'Pale', 
    :img => 'bonfire.png', 
    :price => '5.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i4 = Item.create([{ :name => 'Piny The Elder', 
    :img => 'sunset.png', 
    :price => '15.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
    i5 = Item.create([{ :name => 'Arrogant Basterd', 
    :img => 'sand.png', 
    :price => '3.00', 
    :desc => "Awesome goodness of a beer. This is a description that will be about this long." }]);
    
  end
end