#!/usr/bin/ruby
require 'net/http'
require 'json'
require 'uri'

token = 'your token'

uri = URI.parse('http://api.hipchat.com/v1/users/list?format=json&auth_token=' + token)
json = Net::HTTP.get(uri)
result = JSON.parse(json)
data = result["users"]

outStr = nil;

data.each do | re |
	if outStr.nil? then
		outStr = re["email"].to_s
	else
		outStr = outStr + ";" + re["email"].to_s
	end
end

puts outStr