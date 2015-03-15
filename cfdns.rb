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

def addDns (name, domain, content)

file = File.read('confs/cf-config.json')
config = JSON.parse(file)

response = HTTParty.post(config["url"],
      :body => { 
        "a" => "rec_new",
        "tkn" => config["api-key"],
        "email" => config["email"],
        "z" => domain,
        "type" => "A",
        "name" => name,
        "content" => content,
        "ttl" => 360 
      },
      :header => { 'Content-Type' => 'application/json'}                     
  )

  errorChck response
end

def listDns 

  file = File.read('confs/cf-config.json')
  config = JSON.parse(file)

  response = HTTParty.post(config["url"],
        :body => { 
          "a" => "rec_load_all",
          "tkn" => config["api-key"],
          "email" => config["email"],
          "z" => "mandu.ca"
        },
        :header => { 'Content-Type' => 'application/json'}                     
    )

  res_obj = response["response"]["recs"]["objs"]
  res_obj.each do |x|
    puts x["name"] + " - " + x["content"] + " - " + x["rec_id"]
  end
end


def errorChck(res)
  if res["result"] == "success"
    res_obj = res["response"]["rec"]["obj"]
    puts "Success: " + res_obj["name"] + " - " + res_obj["content"]

  else 
    puts "Error: " + res["msg"]
    
  end
end

if ARGV[0] == "add" and ARGV.size == 4
  name    = ARGV[1]
  domain  = ARGV[2]
  content = ARGV[3]

  puts addDns name, domain, content

elsif ARGV[0] == "list"
  listDns 
end
