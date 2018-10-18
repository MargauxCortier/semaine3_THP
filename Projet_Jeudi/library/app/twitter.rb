require "open-uri"
require "nokogiri"
require "pry"
require "json"
require "dotenv"


Dotenv.load


require "twitter"

scrap = Scrapper.new (@name_town_halls)

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_TOKEN"]
  config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end

@name_town_halls
@handle = []

#création des handle a partir des noms des villes
@arr.each {|i| @handle << "@ville#{i}"}

#follow de chacun des handle créés
@handle.each { |i| @client.follow(i) }
