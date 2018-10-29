require 'httparty'
require 'nokogiri'
require 'byebug' # This module allways you in the shell to check your variables

# Scraper function this will pull from the Data Science Central Twitter

def scraper
  url = 'https://twitter.com/DataScienceCtrl'   # This gets the url to scrape

  raw_page = HTTParty.get(url)    # This is just used to get the page itself Nokogiri will do the rest

  parsed_page = Nokogiri::HTML(raw_page)  # This puts it it into Nokogiri::XML::NodeSet
  # puts parsed_page  # Prints the parsed page as a hash


  # Now that we have the pages lets tarted the elements by CSS class( we cant by html since....well Front end code)

  ds_tweets = parsed_page.css('p.tweet-text')  # Sets a variable to all of the tweets we have

  # puts ds_tweets.class    # This should be the type Nokogiri::XML::NodeSet
  
  puts ds_tweets.text   # This will get just the text that we need from the page it comes in as a string

  # byebug  # using bye bug to test variables
end


# This calls the scraper and runs it
scraper