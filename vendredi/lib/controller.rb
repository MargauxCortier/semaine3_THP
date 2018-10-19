class Controller

	def create_gossip
			# print "> "
			# potin = gets.chomp
			# @gossip = []
			# @gossip << potin
			@gossip = Gossip.new("Jean-Michel Commère", "Féfé est de Bordeaux")
	end

	def save
		File.open("/Users/margaux/iCloud Drive (Archive)/Desktop/semaine3/semaine3_THP/vendredi/db/gossip.json", "w") do |f|
	  f.write(@gossip.to_json)
	end

end

