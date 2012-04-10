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

Team.delete_all

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

team1 = Team.create(	:name => "Polen",
						:acronym => "POL")

team2 = Team.create(	:name => "Griechenland",
						:acronym => "GRE")

team3 = Team.create(	:name => "Russland",
						:acronym => "RUS")

team4 = Team.create(	:name => "Tschechien",
						:acronym => "CZE")

team5 = Team.create(	:name => "Niederlande",
						:acronym => "NED")

team6 = Team.create(	:name => "Dänemark",
						:acronym => "DEN")

team7 = Team.create(	:name => "Deutschland",
						:acronym => "GER")

team8 = Team.create(	:name => "Portugal",
						:acronym => "POR")

team9 = Team.create(	:name => "Spanien",
						:acronym => "ESP")

team10 = Team.create(	:name => "Italien",
						:acronym => "ITA")

team11 = Team.create(	:name => "Irland",
						:acronym => "IRL")

team12 = Team.create(	:name => "Kroatien",
						:acronym => "CRO")

team13 = Team.create(	:name => "Frankreich",
						:acronym => "FRA")

team14 = Team.create(	:name => "England",
						:acronym => "ENG")

team15 = Team.create(	:name => "Ukraine",
						:acronym => "UKR")

team16 = Team.create(	:name => "Schweden",
						:acronym => "SWE")

Game.create(:round_id => round1.id,
			:kickoff => "06/08/2012 18:00",
			:home_team => team1.id,
			:away_team => team2.id
			)

Game.create(:round_id => round1.id,
			:kickoff => "06/08/2012 20:45",
			:home_team => team3.id,
			:away_team => team4.id
			)

Game.create(:round_id => round1.id,
			:kickoff => "06/09/2012 18:00",
			:home_team => team5.id,
			:away_team => team6.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/09/2012 20:45",
			:home_team => team7.id,
			:away_team => team8.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/10/2012 18:00",
			:home_team => team9.id,
			:away_team => team10.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/10/2012 21:45",
			:home_team => team11.id,
			:away_team => team12.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/11/2012 18:00",
			:home_team => team13.id,
			:away_team => team14.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "06/11/2012 20:45",
			:home_team => team15.id,
			:away_team => team16.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/12/2012 18:00",
			:home_team => team2.id,
			:away_team => team4.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/12/2012 20:45",
			:home_team => team1.id,
			:away_team => team3.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/13/2012 18:00",
			:home_team => team6.id,
			:away_team => team8.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/13/2012 20:45",
			:home_team => team5.id,
			:away_team => team7.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/14/2012 18:00",
			:home_team => team10.id,
			:away_team => team12.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/14/2012 20:45",
			:home_team => team9.id,
			:away_team => team11.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/15/2012 18:00",
			:home_team => team15.id,
			:away_team => team13.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "06/15/2012 20:45",
			:home_team => team16.id,
			:away_team => team14.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/16/2012 20:45",
			:home_team => team4.id,
			:away_team => team1.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/16/2012 20:45",
			:home_team => team2.id,
			:away_team => team3.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/17/2012 20:45",
			:home_team => team8.id,
			:away_team => team5.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/17/2012 20:45",
			:home_team => team6.id,
			:away_team => team7.id
			)


Game.create(
			:round_id => round3.id,
			:kickoff => "06/18/2012 20:45",
			:home_team => team12.id,
			:away_team => team9.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/18/2012 20:45",
			:home_team => team10.id,
			:away_team => team11.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/19/2012 20:45",
			:home_team => team14.id,
			:away_team => team15.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "06/19/2012 20:45",
			:home_team => team16.id,
			:away_team => team13.id
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