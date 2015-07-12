require 'dotenv'
Dotenv.load

require 'sinatra'
require 'twilio-ruby'

get '/' do
  'hello world'
end
