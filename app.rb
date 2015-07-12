require 'dotenv'
Dotenv.load

require 'sinatra'
require 'google_directions'
require 'twilio-ruby'
require 'nokogiri'

@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

get '/' do
  directions = GoogleDirections.new("130 brown street waltham", "moes waltham ma")
  content_type 'text/xml'
  directions.xml
end

post '/sms' do
  p params['Body']
end
