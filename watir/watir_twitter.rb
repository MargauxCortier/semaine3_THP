require 'watir'
require 'json'
require 'open-uri'
require 'nokogiri'
require 'pry'



=begin
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
=end





def url_cree(i)
	@handle = []
	page_town_hall = Nokogiri::HTML(open(@page))
		page_town_hall.xpath('//h3[@class="LC20lb"]').each do |node|
			if node.text.include?('@')
				@handle << node.text
			end
		end
end

def test
@arr = ["nanterre", "saintouen", "saintdenis"]
	


	@arr.each do |var|
@page = "https://www.google.fr/search?source=hp&ei=S67IW5mEM86OlwT0jxs&q=mairie+#{var}+%2B+twitter&oq=mairie+#{var}+%2B+twitter&gs_l=psy-ab.3..0i22i30k1.576.10908.0.11021.44.33.10.0.0.0.133.2834.27j6.33.0....0...1.1.64.psy-ab..1.40.2693.0..0j38j35i39k1j0i131k1j0i10k1j0i22i10i30k1j0i8i13i30k1.0.Oqu-bmOWNM0"


	url_cree(@page)


		
  end

end

test
puts @page
p @handle



