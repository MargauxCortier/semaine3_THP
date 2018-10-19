
class Gossip

	attr_reader :content, :author

	def initialize(author, content)
	  @content = content
	  @author = author
	end
end

#Gossip.new(author, content)