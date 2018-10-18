@array = []
puts "Combien de dept ?"
print "> "
@i = gets.chomp.to_i

@i.times do |a|
	puts "n°"+"#{a+1} :"
	print "> "
	b = gets.chomp
	@array << b
end

p @array


def use(arg)
	c = 0
	arg.each do |var|
		puts "Le scrapping des mairies du " + "#{var}" + " est terminé..."+"#{c += 1}/#{@i}"
	end
end


use(@array)