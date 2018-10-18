require 'colored2'
require_relative 'scrapper.rb'

class Index
  attr_accessor :scrapping_town_hall, :results

  def initialize
    @chemin_db = ''
    @url_acceuil = 'http://annuaire-des-mairies.com/'
    system("clear")
    puts "Quel département souhaitez-vous scrapper jusqu'au bout de la nuit ?".bold.white
    puts "      " + "Merci de le mettre sous ce format la : 'chiffre' ".bold.red
    puts
    puts "Ecrivez le numéro du premier département que vous voulez scrapper :".cyan
    print "> "
    @first = gets.chomp
    puts "Ecrivez le numéro du deuxième département que vous voulez scrapper :".yellow
    print "> "
    @second = gets.chomp
    puts "Ecrivez le numéro du troisième département que vous voulez scrapper :".magenta
    print "> "
    @third = gets.chomp
  end

  def scrapping_town_hall
    puts"N'hésite pas à prendre un café, ça va être très loooooooooooong... (comme ma bite)"
    scrap = Scrapper.new (@url_acceuil)
    scrap.perform(@first)
    scrap.perform(@second)
    scrap.perform(@third)
    scrap.municipalities
    f = JsonScrapper.new(scrap.municipalities, @chemin_db).write
    results
  end

  def results
    file = File.read(@chemin_db)
    puts "Veux-tu voir mon gros fichier ? ".bold.blue + "(#{'y'.green}/#{'n'.red})"
    answer = gets.chomp.downcase
      if answer == 'y'
        puts file
      else
        return
      end
  end

end


a = Index.new.scrapping_town_hall
