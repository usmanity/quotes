#!/usr/bin/env ruby

# require 'byebug'
require 'yaml'
require (__dir__ + '/quote.rb')

# puts "Starting a quote session"

# argument_list = ARGV
# args_string = argument_list.join(' ')

# puts args_string

# quote = args_string.split('-')

# author = quote[1]
# saying = quote[0]

# puts author
# puts "said"
# puts saying

def init
  if ARGV.length > 1
    start_parsing_args ARGV
  else
    get_random_quote
  end
end

def get_all_authors
  authors = []
  dirs =  Dir.glob(__dir__ + "/../library/*.yaml")
  # puts __dir__
  # puts '-------'
  dirs.each do |file|
    yaml = YAML.load_file(file)
    author = yaml[:author]
    full_author = {:author => author, :file => file}
    authors << full_author
  end
  authors
end

def get_random_quote
  authors = get_all_authors
  if authors.length == 0
    puts "No quotes found"
    exit
  end
  author = authors.sample
  quote = YAML.load_file(author[:file])
  random_quote = quote[:quotes].sample
  author = author[:author]
  quote = Quote.new(:author => author, :quote_text => random_quote[:quote_text], :date_added => random_quote[:date_added])
  quote.display
end

def start_parsing_args(args)
  if args[0].include? " "
    save_quote args
  else
    puts "You need to include a quote"
    puts <<~EXAMPLE
      Example usage:

        ruby quote.rb "Tell me and I forget. Teach me and I remember. Involve me and I learn." - "Benjamin Franklin"
      
        --- or ---
      
        ruby quote.rb quote="Tell me and I forget. Teach me and I remember. Involve me and I learn." author="Benjamin Franklin"
      
        --- or ---
      
        ruby quote.rb "Tell me and I forget. Teach me and I remember. Involve me and I learn." -Benjamin Franklin
    EXAMPLE
  end
end

def save_quote(args)
  quote = args[0]
  if args.length > 1
    args.delete(args[0])
    author = args.join(' ')
    if author[0] == '-'
      author = author[1..-1]
    end
    quote = Quote.new(:author => author, :quote_text => quote)
    quote.save
    puts "\u2713 Saved"
    quote.display
  end
end

init

# TODO
# - create a function that ingests the ARGV list
# - create a function that splits the String
# - strip away all single, double, special quotes
# - save quote to appropriate file

# Tell me and I forget. Teach me and I remember. Involve me and I learn. -Benjamin Franklin
