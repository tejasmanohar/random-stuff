require 'dotenv'
Dotenv.load

require 'sinatra'
require 'twilio-ruby'

@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

get '/' do
  'hello world'
end
