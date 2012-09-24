 desc "This task is called by the Heroku scheduler add-on"
task :auto_results => :environment do
    puts "Updating results..."
    @cups = Cup.all
	@cups.each do |cup|
		cup.fix_current_results
	end
    puts "done."
end

task :update_game_dates => :environment do
    puts "Updating game dates..."
    @cups = Cup.all
	@cups.each do |cup|
		cup.update_game_dates
	end
	puts "done."
end