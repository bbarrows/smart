require 'bundler'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'authorize-net'
require 'pony'
require 'json'
require 'fileutils' 
require 'tzinfo'

require File.expand_path('../appConfig.rb', __FILE__)

require File.expand_path('../models/item', __FILE__)
require File.expand_path('../models/order', __FILE__)

@test = 0

def create_items_hash()
  items = {}
  Item.all.each do |i|
    items[i.id.to_s] = i
  end
  items
end

def cache(text) 
 # requests to / should be cached as index.html 
 uri = request.env["REQUEST_URI"] == "/" ? 'index' : request.env["REQUEST_URI"] 
 # Don't cache pages with query strings. 
 unless uri =~ /\?/ 
    uri << '.html' 
    # put all cached files in a subdirectory called 'cache' 
    path = File.join(File.dirname(__FILE__), '../public', uri) 
    # Create the directory if it doesn't exist 
    FileUtils.mkdir_p(File.dirname(path)) 
    # Write the text passed to the path 
    File.open(path, 'w') { |f| f.write( text ) } 
  end 
  return text 
end

def random_pronouncable_password(size = 2)
  c = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
  v = %w(a e i o u y)
  f, r = true, ''
  (size * 2).times do
    r << (f ? c[rand * c.size] : v[rand * v.size])
    f = !f
  end
  r
end

helpers do

  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [USER_NAME, PASSWORD]
  end

end

post '/updateOrderStatus' do
  protected!
  status = params[:status]
  orderId = params[:orderId]
  
  order = Order.find(orderId)
  order.status = status
  order.save
end

get '/orders' do
  protected!

  status = params[:status]
  
  if (!status || (status != INCOMPLETE && status != COMPLETE))
    status = INCOMPLETE 
  end
  
  order = params[:order]
  if (!order || (order != DESC && order != ASC))
    order = DESC
  end
  
  @orders = Order.where("status = ?", status).order("created_at").limit(2).offset(0)
  
  @items = create_items_hash
  
  erb :orders
end

get '/' do
  @footer = "Beer fast pass"
  @failure = FAILURE_MESSAGE
  cache(erb(:index))
end


# :number => '4222222222222', #Authorize.net test card, error-producing       
#:number => '4007000000027', #Authorize.net test card, non-error-producing
post '/purchase' do
  ccnum = params[:ccnum] #'4111111111111111'
  last_four = ccnum[-4,4]
  exp = params[:month] + params[:year] #'1120'
  #total = params[:total] Calculate this myself to prevent someone from posting their own value
  email = params[:email]
  @name = params[:name]
  order_json = params[:order_json]
  
  items_hash = create_items_hash
  @order_text = ""
  total = 0
  parsed_order = JSON.parse(order_json)
  
  parsed_order.each_pair do |k,v|
    @order_text = @order_text + v.to_s + " * " + items_hash[k].name 
    total = total + v * + items_hash[k].price 
  end
  
  @purchaseCode = ""
  
  return "Invalid total. Please start purchase over from the beginning." if total.to_i <= 0
  
  transaction = AuthorizeNet::AIM::Transaction.new(AUTHORIZE_LOGIN, AUTHORIZE_KEY, :gateway => GATEWAY)
  #transaction = AuthorizeNet::AIM::Transaction.new(AUTHORIZE_LOGIN, AUTHORIZE_KEY, :gateway => :sandbox)
  credit_card = AuthorizeNet::CreditCard.new(ccnum, exp)
  response = transaction.purchase(total, credit_card)

  if response.success?
    @purchaseCode = random_pronouncable_password.to_s
    
    @order = Order.new do |o|
      o.total = total
      o.order_json = order_json
      o.note = ""
      o.status = INCOMPLETE
      o.code = @purchaseCode
      o.email = email
      o.name = @name
      o.last_four = last_four
      #o.user_id_fullfilled
    end
    
    @order.save
    
    time_zone = TZInfo::Timezone.get('America/Los_Angeles')
    @order_time = time_zone.utc_to_local(@order.created_at).to_s
      
    Pony.mail :to => email,
              :from => FROM_EMAIL,
              :subject => EMAIL_SUBJECT,
              :body => erb(:confirmation_email)
              
    #use @order, @order_text
    Pony.mail :to => FROM_EMAIL,
              :from => FROM_EMAIL,
              :subject => ORDER_SUBJECT + @order.id.to_s,
              :body => erb(:order_email)              
    
    @purchaseCode#SUCCESS_MESSAGE #" (authorization code: #{response.authorization_code})"
  else
    FAILURE_MESSAGE + " to make purchase. #{response.response_reason_text}"
  end
  
end
