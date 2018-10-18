
require 'net/smtp'
require 'mail'
require 'json'


class Mailer

  def intialize
    @mail_mairies = Hash.new

  end


  def envoi
    # settings to call in a ruby hash called "mail_mairies" all data from json file

    file = File.read('./data_base/town_hall.json')
    @mail_mairies = JSON.parse(file)

    # settings to access the sender email account
    Mail.defaults do
    delivery_method :smtp, {  :address              => "smtp.gmail.com",
                              :port                 => 587,
                              :domain               => 'smtp.gmail.com',
                              :user_name            => 'lili64192@gmail.com',
                              :password             => 'momomomo2',
                              :authentication       => 'plain',
                              :enable_starttls_auto => true  }

    end


    # loop to send email to each city council email address from mail_mairies hash

    @mail_mairies.each do |i, v|
      mail = Mail.new do
          to v
          from "lili64192@gmail.com"
          subject "THP"
          body "Bonjour,

    Je m'appelle Margaux, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

    Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de " + i + " veut changer le monde avec nous ?


    Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"

      end

      mail.deliver!
    end
  end

end
