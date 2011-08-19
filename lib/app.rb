require 'bundler'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'

require File.expand_path('../models/item', __FILE__)
require File.expand_path('../models/order', __FILE__)
require File.expand_path('../models/purchase', __FILE__)
require File.expand_path('../models/location', __FILE__)
require File.expand_path('../models/location_item', __FILE__)

get '/' do
  @locations = Location.all
  @footer = "Enjoy Beach Luxury"
  erb :index
end