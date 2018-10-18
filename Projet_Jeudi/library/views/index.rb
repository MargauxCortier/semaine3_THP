
require 'colored2'
require './library/app/scrapper.rb'
require './library/app/json_scrapper.rb'
require './library/app/mailer.rb'

class Index
  attr_accessor :scrapping_town_hall, :results, :send_emails 

  def initialize
    @chemin_db = './data_base/town_hall.json'
    @url_acceuil = 'http://annuaire-des-mairies.com/'
    @depts = []
    system("clear")
    puts "Bienvenue dans l'envoyeur d'emails fou (attention, il y a de quoi faire sauter ton ordi !)".bold.underlined
    puts "Combien de département souhaites-tu scrapper ? (plus tu en mets, plus c'est long...)"
    print "> "
    @many = gets.chomp.to_i
    puts
    puts "Quels départements souhaites-tu scrapper jusqu'au bout de la nuit ?".bold
    puts "      " + "Merci de le mettre sous ce format la : 'chiffre' (ex: 01, 92) ".bold.red
    puts
    @many.times do |a|
      print "Département n°".blue + "#{a+1}".bold.red + " : ".blue
      dpt = gets.chomp
      @depts << dpt
      puts
    end
    puts "Tu as sélectionné les départements suivant : #{@depts}"
  end

  def scrapping_town_hall
    puts
    puts "Le scrapping des données va commencer." + ";-)".yellow
    puts "N'hésite pas à prendre un café, ça va être très loooooooooooong... (comme ma bite)"
    c = 0
    scrap = Scrapper.new (@url_acceuil)
    @depts.each do |var|
      scrap.perform(var)
      puts "Le scrapping des mairies du ".green + "#{var.bold.cyan}" + " est terminé...".green + "#{c += 1}/#{@many}"
    end
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
