require "open-uri"
require "nokogiri"
require "pry"
require "json"
require "dotenv"
require "twitter"

require './library/app/scrapper.rb'


Dotenv.load


class Twittos


	def twittositos

	scrap = Scrapper.new('http://annuaire-des-mairies.com/')
	scrap.get_all_the_town_halls_names('http://annuaire-des-mairies.com/')


	@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_API_KEY"]
	  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
	  config.access_token        = ENV["TWITTER_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
	end

	@name_town_halls1 = scrap.name_town_halls
	@handle = []

	#création des handle a partir des noms des villes
	@name_town_halls1.each {|i| @handle << "@ville#{i}"}

	#follow de chacun des handle créés
	@handle.each { |i| @client.follow(i) }
	end	

	
end
