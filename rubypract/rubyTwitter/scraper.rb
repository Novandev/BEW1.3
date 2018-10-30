require 'httparty'
require 'nokogiri'
require 'byebug' # This module allways you in the shell to check your variables

# Scraper function this will pull from the Data Science Central Twitter

def scraper
  url = 'https://twitter.com/DataScienceCtrl'   # This gets the url to scrape

  raw_page = HTTParty.get(url)    # This is just used to get the page itself Nokogiri will do the rest

  parsed_page = Nokogiri::HTML(raw_page)  # This puts it it into Nokogiri::XML::NodeSet
  # puts parsed_page  # Prints the parsed page as a Nokogiri Nodelist


  # Now that we have the pages lets tarted the elements by CSS class( we cant by html since....well Front end code)

  ds_tweets = parsed_page.css('p.tweet-text')  # Sets a variable to all of the tweets we have

  # puts ds_tweets.class    # This should be the type Nokogiri::XML::NodeSet

  # ds_tweets.each do |tweet|   # This will loop over the nodeSet like and array and we can access the text via the .text mehod
  #   puts tweet.text
  # end

  # Now that we can see the tweets, lets put them into a data structure in this case a hash/dictionary
  tweet_array = Array.new
  ds_tweets.each do |dsTweet|
    tweet_hash = {
        tweet: dsTweet.text
    }
    tweet_array.push(tweet_hash)
  end

  tweet_array.each do |key, value|
    puts key
    puts value

  end

  # byebug  # using bye bug to test variables
end   # end of the scraper function block


# This calls the scraper and runs it
scraper