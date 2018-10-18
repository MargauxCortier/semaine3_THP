require 'watir'
require 'json'

browser = Watir::Browser.new()
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("mairie nanterre + twitter")

submit_button = browser.button(type:"button")
submit_button.click
twitters = Array.new
search_result_divs = browser.divs(class:"r")

search_result_divs.each { |div| twitters << div.h3.text.split[1][1..-2] }
p twitters[0]

File.open("/home/irabespodobna/THP/week3/Jeudi/semaine3_THP/watir/array.json","w") do |f|
f.write(twitters[0].to_json)
end

sleep(3)
p "Méfait accompli, fermeture du browser"
browser.close
