require 'dotenv'
Dotenv.load

require 'sinatra'
require 'google_directions'
require 'twilio-ruby'
require 'nokogiri'

@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

get '/' do
  response = GoogleDirections.new("130 brown street waltham", "moes waltham ma")
  doc = Nokogiri::XML(response.xml)
  doc.xpath('/DirectionsResponse/route/leg/step/html_instructions').each do |step|
    p step.content
  end
  'hello'
end

post '/sms' do
  p params['Body']
end
