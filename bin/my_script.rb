require 'addressable/uri'
require 'rest-client'


url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/'
).to_s

puts RestClient.get(
  url,
  {user: {id: 1}}
)
