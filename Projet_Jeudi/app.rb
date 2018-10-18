
require 'colored2'
require "open-uri"
require "nokogiri"
require "pry"
require 'net/smtp'
require 'mail'
require 'json'
require 'twitter'
require 'dotenv'
require 'watir'

require './library/app/json_scrapper.rb'
require './library/app/mailer.rb'
require './library/app/scrapper.rb'
require './library/app/twitter.rb'
#require './library/app/'
require './library/views/index.rb'


def restart_loop
	puts
	puts
	puts
  puts "Veux-tu recommencer avec d'autres départements ? " "( #{'O'.green.bold} / #{'n'.red.bold} )"
  print '> '
  if gets.chomp.to_s.downcase == 'o' 
    system('clear')
    Index.new.scrapping_town_hall
    restart_loop
  else
  	system('clear')
    exit 
  end
end


Index.new.scrapping_town_hall
restart_loop