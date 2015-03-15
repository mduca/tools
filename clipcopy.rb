#!/usr/bin/env ruby
# ctrl-c long url to clipboard
# run this script
# ctrl-v to paste short goo.gl url

require "clipboard"
require "httparty"
require "json"

class Google
  include HTTParty
  format :json
end

url = "https://www.googleapis.com/urlshortener/v1/url"
api = "AIzaSyCf89w0sWznK_YL3ate4Awm1DzWUIrp9Ks"
clip = Clipboard.paste

response = Google.post(url,
  :headers=>  { "Content-type" => "application/json" },
  :query =>   { :key => api },
  :body =>    { "longUrl" => clip }.to_json
)

Clipboard.copy response["id"].to_s
