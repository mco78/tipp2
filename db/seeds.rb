# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Bet.delete_all

Game.delete_all

Round.delete_all

Cup.delete_all

Post.delete_all

cup1 = Cup.create(:name => "EM2012")

round1 = Round.create(	:name => "Vorrunde, 1. Spt.",
						:leg => 1,
						:cup_id => cup1.id)

round2 = Round.create(	:name => "Vorrunde, 2. Spt.",
						:leg => 2,
						:cup_id => cup1.id)

round3 = Round.create(	:name => "Vorrunde, 3. Spt.",
						:leg => 3,
						:cup_id => cup1.id)

Game.create(:round_id => round1.id,
			:kickoff => "06/08/2012 18:00",
			:hometeam => 'Polen',
			:awayteam => 'Griechenland'
			)

Game.create(:round_id => round1.id,
			:kickoff => "06/08/2012 20:45",
			:hometeam => 'Russland',
			:awayteam => 'Tschechien'
			)

Game.create(:round_id => round1.id,
			:kickoff => "06/09/2012 18:00",
			:hometeam => 'Niederlande',
			:awayteam => 'Dänemark'
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/09/2012 20:45",
			:hometeam => 'Deutschland',
			:awayteam => 'Portugal'
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/10/2012 18:00",
			:hometeam => 'Spanien',
			:awayteam => 'Italien'
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/10/2012 21:45",
			:hometeam => 'Irland',
			:awayteam => 'Kroatien'
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/11/2012 18:00",
			:hometeam => 'Frankreich',
			:awayteam => 'England'
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/11/2012 20:45",
			:hometeam => 'Ukraine',
			:awayteam => 'Schweden'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/12/2012 18:00",
			:hometeam => 'Griechenland',
			:awayteam => 'Tschechien'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/12/2012 20:45",
			:hometeam => 'Polen',
			:awayteam => 'Russland'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/13/2012 18:00",
			:hometeam => 'Dänemark',
			:awayteam => 'Portugal'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/13/2012 20:45",
			:hometeam => 'Niederlande',
			:awayteam => 'Deutschland'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/14/2012 18:00",
			:hometeam => 'Italien',
			:awayteam => 'Kroatien'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/14/2012 20:45",
			:hometeam => 'Spanien',
			:awayteam => 'Irland'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/15/2012 18:00",
			:hometeam => 'Ukraine',
			:awayteam => 'Frankreich'
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/15/2012 20:45",
			:hometeam => 'Schweden',
			:awayteam => 'England'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/16/2012 20:45",
			:hometeam => 'Tschechien',
			:awayteam => 'Polen'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/16/2012 20:45",
			:hometeam => 'Griechenland',
			:awayteam => 'Russland'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/17/2012 20:45",
			:hometeam => 'Portugal',
			:awayteam => 'Niederlande'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/17/2012 20:45",
			:hometeam => 'Dänemark',
			:awayteam => 'Deutschland'
			)


Game.create(
			:round_id => round3.id,
			:kickoff => "06/18/2012 20:45",
			:hometeam => 'Kroatien',
			:awayteam => 'Spanien'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/18/2012 20:45",
			:hometeam => 'Italien',
			:awayteam => 'Irland'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/19/2012 20:45",
			:hometeam => 'England',
			:awayteam => 'Ukraine'
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/19/2012 20:45",
			:hometeam => 'Schweden',
			:awayteam => 'Frankreich'
			)



Post.create(:headline 	=> "Hello World!",
			:category 	=> "News",
			:content	=> "Dies ist der erste Newsbeitrag, welcher automatisch 
							erstellt wurde. Lorem ipsum dolor sit amet, consetetur 
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt 
							ut labore et dolore magna aliquyam erat, sed diam voluptua.")

Post.create(:headline 	=> "World still there?",
			:category 	=> "News",
			:content	=> "Dies ist der zweite Newsbeitrag. Lorem ipsum dolor sit amet, consetetur 
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt 
							ut labore et dolore magna aliquyam erat, sed diam voluptua.")