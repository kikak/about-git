#!/usr/bin/env ruby
#encoding:utf-8
require 'net/http'
require 'json'
require 'uri'

exit 0 if ARGV.empty?

GRAPH_API_URL = 'http://graph.facebook.com/'
FB_API_URL    = 'http://api.facebook.com/'
base_domain    = URI.parse(ARGV[0]).host.downcase =~  /\.(\S+\.[a-z]{1,3})$/i ? $1 : nil
def ok?(response)
	response.code =='200'
end

url_about_article = "http://api.facebook.com/method/links.getStats"+"?urls=#{ARGV[0]}&format=json"
response = Net::HTTP.get_response(URI.parse(url_about_article))
response = JSON.parse(response.body)[0]
p "Like count: #{response['like_count']}"
p "Share count: #{response['share_count']}"
