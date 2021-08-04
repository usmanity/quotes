#!/usr/bin/env ruby

puts "Starting a quote session"

argument_list = ARGV
args_string = argument_list.join(' ')

puts args_string

quote = args_string.split('-')

author = quote[1]
saying = quote[0]

puts author
puts "said"
puts saying

# TODO
# - create a function that ingests the ARGV list
# - create a function that splits the String
# - strip away all single, double, special quotes
# - save quote to appropriate file
