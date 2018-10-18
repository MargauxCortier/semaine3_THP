
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
#require './library/app/'
require './library/views/index.rb'


def restart
  puts 'Veux-tu recommencer ? ' "( #{'y'.green.bold} / #{'n'.red.bold} )"
  print '> '
  answer = gets.chomp.downcase
  if answer == 'y'
    system('clear')
    Index.new.scrapping_town_hall
    restart
  else
  	system('clear')
    exit
  end
end

Index.new.scrapping_town_hall
restart
