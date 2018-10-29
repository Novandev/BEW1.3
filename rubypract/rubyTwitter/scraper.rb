require 'httparty'
require 'nokogiri'
require 'byebug' # This module allways you in the shell to check your variables

# Scraper function this will pull from the Data Science Central Twitter

def scraper
  url = 'https://twitter.com/DataScienceCtrl'   # This gets the url to scrape
  raw_page = HTTParty.get(url)    # This is just used to get the page itself Nokogiri will do the rest
  parsed_page = Nokogiri::HTML(raw_page)  # This puts it it into hash/dictionary/object notation
  puts parsed_page
  # Now that we have the pages lets tarted the elements by CSS class( we cant by html since....well Front end code)

  
  byebug
end


# This calls the scraper and runs it
scraper