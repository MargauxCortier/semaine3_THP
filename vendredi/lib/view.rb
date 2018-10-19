
class View
  
  def create_gossip

    puts "Comment t'appelles-tu ?"
    author_user = gets.chomp
    puts "Quel est ton gossip ?"
    content_user = gets.chomp 
    @params = {author: author_user,content: content_user}
    return @params 
  end

end
