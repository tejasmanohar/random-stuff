require 'dotenv'
Dotenv.load

require 'sinatra'
require 'google_directions'
require 'twilio-ruby'

@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

get '/' do
  'hello world'
end

post '/sms' do
  p params['Body']
end
