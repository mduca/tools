#!/usr/bin/env ruby
# Copy any long form url to your clipboard. (ctrl+c)
# Then run this script. After the script executes
# the new shortened goo.gl url will be in the
# clibpboard ready to be pasted. (ctrl+v)

require "clipboard"
require "httparty"
require "json"

class Google
  include HTTParty
  format :json
end

# Example url-config.json
# {
#   "url" : "https://www.googleapis.com/urlshortener/v1/url",
#   "api" : "AIzaSyBW5fsScqPZsv2OjUhgqnrIjfZFhwlGFTw"
# }

fname = File.join(File.dirname(__FILE__), "confs/url-config.json")
file = File.read(fname)
config = JSON.parse(file)

clip = Clipboard.paste

response = Google.post(config["url"],
  :headers=>  { "Content-type" => "application/json" },
  :query =>   { :key => config["api"] },
  :body =>    { "longUrl" => clip }.to_json
)

# Copy to clipboard
Clipboard.copy response["id"].to_s
