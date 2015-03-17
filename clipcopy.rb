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


fname = File.join(File.dirname(__FILE__), "confs/url-config.json")
file = File.read(fname)
config = JSON.parse(file)


clip = Clipboard.paste

response = Google.post(config["url"],
  :headers=>  { "Content-type" => "application/json" },
  :query =>   { :key => config["api"] },
  :body =>    { "longUrl" => clip }.to_json
)

Clipboard.copy response["id"].to_s
