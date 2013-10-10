#!/usr/bin/env ruby
#encoding:utf-8
#
require 'net/http'
require 'json'
require 'uri'

exit 0 if ARGV.empty?

GRAPH_API_URI = 'http://graph.facebook.com/'
FB_API_URL = 'http://api.facebook.com'

def ok?(response)
  response.code == '200'
end

uri_for_page = "#{GRAPH_API_URI}idnes.cz"
p uri_for_page
response = Net::HTTP.get_response(URI.parse(uri_for_page))
response.code
p JSON.parse(response.body)['id']
