require 'rubygems'
require 'bundler'

Bundler.require

require File.expand_path('../lib/app', __FILE__)

database_urls = {
    :development => 'mysql://root:password@127.0.0.1:3306/beer',
    :production     => 'mysql://root:password@127.0.0.1:3306/beer',
    :test       => 'mysql://root:password@127.0.0.1:3306/beer'
}
set :database, database_urls[settings.environment]


set :run, false
set :public, './public'
set :views, './views'
set :environment, :production
run Sinatra::Application

