# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Game.delete_all

Game.create(:cup => "EM",
			:round => "Vorrunde",
			:kickoff => "06/08/2012 18:00",
			:hometeam => 'Polen',
			:awayteam => 'Griechenland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde",
			:kickoff => "06/08/2012 20:45",
			:hometeam => 'Russland',
			:awayteam => 'Tschechien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde",
			:kickoff => "06/09/2012 18:00",
			:hometeam => 'Niederlande',
			:awayteam => 'Dänemark'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde",
			:kickoff => "06/09/2012 20:45",
			:hometeam => 'Deutschland',
			:awayteam => 'Dänemark'
			)