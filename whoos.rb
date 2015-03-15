#!/usr/bin/env ruby
# Ruby tool to determine whose OS is used

os = RbConfig::CONFIG["host_os"]

if os == "mingw32"
  puts "Windows"
elsif os == "linux-gnu"
  puts "Linux"
else
  puts "Mac"
end
