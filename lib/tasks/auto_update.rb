t = Thread.new do
@cups = Cup.all
	3.times do
		tm = Time.now
		if tm.wday === 3 #wednesday update dates
			if tm.hour === 12
				if tm.min === 0
					@cups.each do |cup|
						cup.update_game_dates
						File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Update Game Dates durchgefuert *** ")}
					end
				end
			end
		end
		if tm.wday === 5 #friday
			if tm.hour === 22
				if tm.min === 30
					10.times do |i|
						@cups.each do |cup|
							cup.fix_current_results
							#File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** ")}
						end
						sleep 120
					end
				end
			end
		end
		if tm.wday === 6 #saturday
			if tm.hour === 17
				if tm.min === 15
					10.times do |i|
						@cups.each do |cup|
							cup.fix_current_results
							#File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** ")}
						end
						sleep 120
					end
				end
			end
			if tm.hour === 20
				if tm.min === 15
					10.times do |i|
						@cups.each do |cup|
							cup.fix_current_results
							#File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** ")}
						end
						sleep 120
					end
				end
			end
		end
		if tm.wday === 7 #sunday
			if tm.hour === 17
				if tm.min === 15
					10.times do |i|
						@cups.each do |cup|
							cup.fix_current_results
							#File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** ")}
						end
						sleep 120
					end
				end
			end
			if tm.hour === 19
				if tm.min === 15
					10.times do |i|
						@cups.each do |cup|
							cup.fix_current_results
							#File.open("log/auto_update.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** Fix current results durchgefuert *** ")}
						end
						sleep 120
					end
				end
			end
		end
		puts "Zeit: " + Time.now.to_s
		sleep 60
	end
	sleep 600
end