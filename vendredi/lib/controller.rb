require 'view'
require 'gossip'
require 'json'

class Controller

	def initialize
		@view = View.new
	end

	def create_gossip
			# print "> "
			# potin = gets.chomp
			# @gossip = []
			# @gossip << potin
			#@view = View.new
			params = @view.create_gossip
			@table = []
			@gossip = Gossip.new(params[:author], params[:content])
			@table << @gossip
			
	end

	def save
		File.open("/Users/Pauline/Desktop/THP_Formation/3.Semaine/semaine3_THP/vendredi/db/gossip.json" "w") do |f|
		f.write(@table.to_json)
		end
		@gossip.save
	end

end
