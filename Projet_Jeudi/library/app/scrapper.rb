require "open-uri"
require "nokogiri"
require "pry"
require "json"


class Scrapper
  attr_accessor :accueil, :email_town_hall, :town_halls, :name_town_hall, :municipalities

  def initialize(page)
    @accueil = page
    @email_town_hall = ""
    @town_halls = []
    @name_town_hall = ""
    @municipalities = {}
    @url_dept = ""
  end

  def department_number(number)
    if number.is_a? Integer
      number = number.to_s
    elsif !number.is_a? String
      puts "Tu n'as pas écrit un numéro au bon format de département petit Saligo !"
      exit
    end
    page = Nokogiri::HTML(open(@accueil))
    page.xpath('//a').each do |node|
      @url_dept = @accueil + node.values[1] if node.text.include?(number.to_s + " |")
    end
  end


  def url_town_hall
    page = Nokogiri::HTML(open(@url_dept))
    page.xpath('//a[@class = "lientxt"]').each do |node|
      if node.values[1][0].include?(".")
        @town_halls << @accueil + node.values[1][2..-1]
      end
    end
    @town_halls
  end


  def get_mail(town)
    page = Nokogiri::HTML(open(town))
    page.xpath('//td').each do |node|
      if node.text.include?("@")
        @email_town_hall = node.text
        break
      else
        @email_town_hall = "No mail found"
      end
    end
    @email_town_hall
  end


  def get_name(town)
    page = Nokogiri::HTML(open(town))
    page.xpath('//h1').each do |node|
      if node.text.include?(" - ")
        @name_town_hall = node.text
      end
    end
    @name_town_hall
  end


  def perform(number)
    # récupère les url des départements que l'on a sélectionné
    department_number(number)
    # scrappe les url de chacune des mairies des départements sélectionnés
    url_town_hall
    # pour chacune des mairies, il récupère le nom et l'email de la mairie
    @town_halls.each { |i|
      get_name(i)
      @municipalities[@name_town_hall] = get_mail(i)
    }
  end
end
