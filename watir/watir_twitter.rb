require 'watir'

browser = Watir::Browser.new()
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("mairie nanterre + twitter")

#méthode de la barre d'entrée
search_bar.send_keys(:enter)

#méthode du clic
#submit_button = browser.button(type:"button")
#submit_button.click

#browser.driver.manage.timeouts.implicit_wait = 3
search_result_divs = browser.divs(class:"r")
search_result_divs.each { |div| p div.h3.text }
sleep(3)

p "Méfait accompli, fermeture du browser"
browser.close