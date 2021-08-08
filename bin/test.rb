# includes quote.rb file
require './quote.rb'
require 'date'

q = Quote.new(:author => 'Jane Doe', :quote => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', :date_added => Date.today)

# puts q.to_s

# q.save
# q.save

# q.read_all
# q.get_random_quote
