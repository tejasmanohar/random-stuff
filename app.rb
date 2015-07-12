require 'dotenv'
Dotenv.load

require 'sinatra'

get '/' do
  'hello world'
end
