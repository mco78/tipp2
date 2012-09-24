@cups = Cup.all
@cups.each do |cup|
	cup.fix_current_results
	puts "Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** "
end