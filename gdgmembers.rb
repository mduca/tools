#!/bin/env ruby
#
# Show members of GDG-Berkeley Meetup
#

require 'nokogiri'
require 'open-uri'

@response = Nokogiri::HTML(open("http://www.meetup.com/GDGBerkeley/"))
number = @response.css("span[class='lastUnit align-right']")[0].text
puts number
