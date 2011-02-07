#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'typhoeus'

puts uptime=`uptime`
match_load=/load average: ([\.\d]+), ([\.\d]+), ([\.\d]+)/
average_load=match_load.match uptime

mac=`cat /proc/net/if_inet6`
match_mac=/\n(\S+)\s.*eth0/
eth0=match_mac.match mac

url="http://localhost:3000/records.js"
hash={:mac=>eth0[1], 
  :record_at => Time.now,
  :average_load_1=>average_load[1],
  :average_load_5=>average_load[2],
  :average_load_15=>average_load[3]}
json_request=JSON.pretty_generate hash

request = Typhoeus::Request.new(url,
                            :body          => json_request,
                            :method        => :post,
                            :headers       => {:Accepts => "text/xml"}
                            #:timeout       => 100, # milliseconds
                            #:cache_timeout => 60, # seconds
                            #:params        => {:field1 => "a field"})
                            )
#request = Typhoeus::Request.new("http://www.google.com")
request.on_complete do |response|
  response.body
end

hydra = Typhoeus::Hydra.new

hydra.queue(request)
 
hydra.run

puts request.handled_response
