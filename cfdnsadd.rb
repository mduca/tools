# Cloudflare new DNS creationg tool
#
# touch cf-config.json
#
# {
#   "api-key" : "superlongplaceholderkey134we987t2",
#   "email"   : "your.email@here.com",
#   "url"     : "https://www.cloudflare.com/api_json.html"
# }
#


require "httparty"
require "json"

file = File.read('confs/cf-config.json')
config = JSON.parse(file)

res = HTTParty.post(config["url"],
    :body => { 
          "a" => "rec_new",
          "tkn" => config["api-key"],
          "email" => config["email"],
          "z" => "mandu.ca",
          "type" => "A",
          "name" => "test6",
          "content" => "192.168.1.1",
          "ttl" => 360
    },
    :header => { 'Content-Type' => 'application/json'}                     
)

puts res

if res["result"] == "success"
  res_obj = res["response"]["rec"]["obj"]
  puts "Success: " + res_obj["name"] + " - " + res_obj["content"]

else 
  puts "Error: " + res["msg"]
  
end

