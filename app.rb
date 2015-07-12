require 'dotenv'
Dotenv.load

require 'sinatra'
require 'google_directions'
require 'twilio-ruby'
require 'nokogiri'
require 'sanitize'

post '/sms' do
  places = params[:Body].split('to')
  response = GoogleDirections.new(places.first, places.last)
  doc = Nokogiri::XML(response.xml)
  directions = ''
  doc.xpath('/DirectionsResponse/route/leg/step/html_instructions').each do |step|
    directions << Sanitize.fragment("#{step.content}\n")
  end
  @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: params[:From],
    body: directions
  )
  p directions
  directions
end
