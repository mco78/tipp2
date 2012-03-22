# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Bet.delete_all

Game.delete_all

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/08/2012 18:00",
			:hometeam => 'Polen',
			:awayteam => 'Griechenland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/08/2012 20:45",
			:hometeam => 'Russland',
			:awayteam => 'Tschechien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/09/2012 18:00",
			:hometeam => 'Niederlande',
			:awayteam => 'Daenemark'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/09/2012 20:45",
			:hometeam => 'Deutschland',
			:awayteam => 'Portugal'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/10/2012 18:00",
			:hometeam => 'Spanien',
			:awayteam => 'Italien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/10/2012 21:45",
			:hometeam => 'Irland',
			:awayteam => 'Kroatien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/11/2012 18:00",
			:hometeam => 'Frankreich',
			:awayteam => 'England'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 1.Spt.",
			:kickoff => "06/11/2012 20:45",
			:hometeam => 'Ukraine',
			:awayteam => 'Schweden'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/12/2012 18:00",
			:hometeam => 'Griechenland',
			:awayteam => 'Tschechien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/12/2012 20:45",
			:hometeam => 'Polen',
			:awayteam => 'Russland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/13/2012 18:00",
			:hometeam => 'Daenemark',
			:awayteam => 'Portugal'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/13/2012 20:45",
			:hometeam => 'Niederlande',
			:awayteam => 'Deutschland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/14/2012 18:00",
			:hometeam => 'Italien',
			:awayteam => 'Kroatien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/14/2012 20:45",
			:hometeam => 'Spanien',
			:awayteam => 'Irland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/15/2012 18:00",
			:hometeam => 'Ukraine',
			:awayteam => 'Frankreich'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 2.Spt.",
			:kickoff => "06/15/2012 20:45",
			:hometeam => 'Schweden',
			:awayteam => 'England'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/16/2012 20:45",
			:hometeam => 'Tschechien',
			:awayteam => 'Polen'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/16/2012 20:45",
			:hometeam => 'Griechenland',
			:awayteam => 'Russland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/17/2012 20:45",
			:hometeam => 'Portugal',
			:awayteam => 'Niederlande'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/17/2012 20:45",
			:hometeam => 'Daenemark',
			:awayteam => 'Deutschland'
			)


Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/18/2012 20:45",
			:hometeam => 'Kroatien',
			:awayteam => 'Spanien'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/18/2012 20:45",
			:hometeam => 'Italien',
			:awayteam => 'Irland'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/19/2012 20:45",
			:hometeam => 'England',
			:awayteam => 'Ukraine'
			)

Game.create(:cup => "EM",
			:round => "Vorrunde, 3.Spt.",
			:kickoff => "06/19/2012 20:45",
			:hometeam => 'Schweden',
			:awayteam => 'Frankreich'
			)