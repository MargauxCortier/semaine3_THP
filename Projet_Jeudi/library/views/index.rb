
require 'colored2'
require './library/app/scrapper.rb'
require './library/app/json_scrapper.rb'
require './library/app/mailer.rb'

class Index
  attr_accessor :scrapping_town_hall, :results, :send_emails

  def initialize
    @chemin_db = './data_base/town_hall.json'
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

    puts "Le scrapping des mairies du " + "#{@first.bold.cyan}" + " est terminé...".green

    scrap.perform(@second)

    puts "Le scrapping des mairies du " + "#{@second.bold.yellow}"+"est terminé...".green

    scrap.perform(@third)

    puts "Le scrapping des mairies du " + "#{@third.bold.magenta}" + " est terminé...".green
    puts
    f = JsonScrapper.new(scrap.municipalities, @chemin_db).jsonw
    results
    puts
    send_emails
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

  def send_emails
    puts "Voulez-vous envoyer un email à toute la DB ?".bold.blue + "(#{'y'.green}/#{'n'.red})"
    answer = gets.chomp.downcase
      if answer == 'y'
        Mailer.new.envoi
      else
        return
      end
  end

end



a = Index.new.scrapping_town_hall
