#!/usr/bin/env ruby

if ARGV.size < 2
  puts "virgil <cname> <package manager>"
  exit 1
end

require 'rubygems'
require 'net/http'
require 'json'

cname, os, package_manager = ARGV
HOSTNAME='example.com'

response = Net::HTTP.get HOSTNAME, "/#{package_manager}/#{cname}"
packages = JSON.parse(response)

puts "You should install the following packages:\n\t#{packages.join(' ')}"
