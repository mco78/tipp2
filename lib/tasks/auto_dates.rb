@cups = Cup.all
@cups.each do |cup|
	cup.update_game_dates
	puts "Zeit: " + Time.now.to_s + " *** Update Game Dates durchgefuert *** "
end