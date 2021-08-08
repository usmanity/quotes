require 'yaml'
require 'byebug'
require 'date'

class Quote
  attr_reader :author, :quote_text, :date_added, :file_name

  def initialize(args)
    @author = args[:author]
    @quote_text = args[:quote_text]
    @date_added = args[:date_added] || Date.today
    @quote_date = args[:quote_date]
    @file_name = get_file_name
  end

  def to_s
    q = open_file
    puts q.inspect
    "Author: #{author}\nQuote: #{quote_text}\nDate Added: #{date_added}\nFilename: #{file_name}"
  end

  def get_file_name
    '../library/' + author.gsub(/\s+/, '_').downcase + '.yaml'
  end

  # def get_random_quote
  #   q = open_file
  #   quotes = q[:quotes]
  #   quotes[:author] = author
  #   r = quotes.sample
  #   display r
  # end

  # def read_all
  #   quotes_file = open_file
  #   puts quotes_file.inspect
  #   quotes_file[:quotes].each do |quote|
  #     display quote
  #   end
  # end

  def save
    quotes_file = open_file
    new_quote = { :quote_text => @quote_text, :date_added => @date_added }
    quotes_file[:quotes] << new_quote
    File.open(file_name, 'w') do |file|
      file.write YAML.dump quotes_file
    end
  end

  def open_file
    begin
      quotes_file = YAML.load_file(file_name)
    rescue
      File.open(file_name, 'w') do |file|
        file.write YAML.dump({ :author => author, :quotes => [] })
      end
      quotes_file = YAML.load_file(file_name)
    end
    return quotes_file
  end

  def display
    puts <<~QUOTE

    \e[32m\u201C#{quote_text}\u201D\e[0m
    \e[36m\u21A3 #{author} \e[0m(Added on #{date_added})

    QUOTE
  end
end

