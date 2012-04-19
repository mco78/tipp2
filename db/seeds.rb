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

round1 = Round.create(	:name 	=> "Vorrunde, 1. Spt.",
						:leg 	=> 1,
						:cup_id => cup1.id)

round2 = Round.create(	:name 	=> "Vorrunde, 2. Spt.",
						:leg 	=> 2,
						:cup_id => cup1.id)

round3 = Round.create(	:name 	=> "Vorrunde, 3. Spt.",
						:leg 	=> 3,
						:cup_id => cup1.id)

team1 = Team.create(	:name 	=> "Polen",
						:acronym => "POL")

team2 = Team.create(	:name 	=> "Griechenland",
						:acronym => "GRE")

team3 = Team.create(	:name 	=> "Russland",
						:acronym => "RUS")

team4 = Team.create(	:name 	=> "Tschechien",
						:acronym => "CZE")

team5 = Team.create(	:name 	=> "Niederlande",
						:acronym => "NED")

team6 = Team.create(	:name 	=> "Dänemark",
						:acronym => "DEN")

team7 = Team.create(	:name 	=> "Deutschland",
						:acronym => "GER")

team8 = Team.create(	:name 	=> "Portugal",
						:acronym => "POR")

team9 = Team.create(	:name 	=> "Spanien",
						:acronym => "ESP")

team10 = Team.create(	:name 	=> "Italien",
						:acronym => "ITA")

team11 = Team.create(	:name 	=> "Irland",
						:acronym => "IRL")

team12 = Team.create(	:name 	=> "Kroatien",
						:acronym => "CRO")

team13 = Team.create(	:name 	=> "Frankreich",
						:acronym => "FRA")

team14 = Team.create(	:name 	=> "England",
						:acronym => "ENG")

team15 = Team.create(	:name 	=> "Ukraine",
						:acronym => "UKR")

team16 = Team.create(	:name 	=> "Schweden",
						:acronym => "SWE")

Game.create(:round_id => round1.id,
			:kickoff => "04/16/2012 18:00",
			:home_team => team1.id,
			:away_team => team2.id
			)

Game.create(:round_id => round1.id,
			:kickoff => "04/16/2012 20:45",
			:home_team => team3.id,
			:away_team => team4.id
			)

Game.create(:round_id => round1.id,
			:kickoff => "04/16/2012 18:00",
			:home_team => team5.id,
			:away_team => team6.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "04/16/2012 20:45",
			:home_team => team7.id,
			:away_team => team8.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "04/16/2012 18:00",
			:home_team => team9.id,
			:away_team => team10.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "04/16/2012 21:45",
			:home_team => team11.id,
			:away_team => team12.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "04/16/2012 18:00",
			:home_team => team13.id,
			:away_team => team14.id
			)

Game.create(
			:round_id => round1.id,
			:kickoff => "04/16/2012 20:45",
			:home_team => team15.id,
			:away_team => team16.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 18:00",
			:home_team => team2.id,
			:away_team => team4.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 20:45",
			:home_team => team1.id,
			:away_team => team3.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 18:00",
			:home_team => team6.id,
			:away_team => team8.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 20:45",
			:home_team => team5.id,
			:away_team => team7.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 18:00",
			:home_team => team10.id,
			:away_team => team12.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 20:45",
			:home_team => team9.id,
			:away_team => team11.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 18:00",
			:home_team => team15.id,
			:away_team => team13.id
			)

Game.create(
			:round_id => round2.id,
			:kickoff => "04/18/2012 20:45",
			:home_team => team16.id,
			:away_team => team14.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team4.id,
			:away_team => team1.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team2.id,
			:away_team => team3.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team8.id,
			:away_team => team5.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team6.id,
			:away_team => team7.id
			)


Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team12.id,
			:away_team => team9.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team10.id,
			:away_team => team11.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team14.id,
			:away_team => team15.id
			)

Game.create(
			:round_id => round3.id,
			:kickoff => "04/19/2012 20:45",
			:home_team => team16.id,
			:away_team => team13.id
			)

cup2 = Cup.create(:name => "Bundesliga 2011/2012")

round4 = Round.create(	:name => "32. Spieltag",
						:leg => 32,
						:cup_id => cup2.id)

round5 = Round.create(	:name => "33. Spieltag",
						:leg => 33,
						:cup_id => cup2.id)

round6 = Round.create(	:name => "34. Spieltag",
						:leg => 34,
						:cup_id => cup2.id)

team17 = Team.create(	:name => "1. FSV Mainz 05",
						:acronym => "MNZ")

team18 = Team.create(	:name => "VfL Wolfsburg",
						:acronym => "WFB")

team19 = Team.create(	:name => "1899 Hoffenheim",
						:acronym => "HOF")

team20 = Team.create(	:name => "Bayer Leverkusen",
						:acronym => "LEV")

team21 = Team.create(	:name => "Werder Bremen",
						:acronym => "WER")

team22 = Team.create(	:name => "Bayern München",
						:acronym => "BAY")

team23 = Team.create(	:name => "1. FC Nürnberg",
						:acronym => "NUR")

team24 = Team.create(	:name => "Hamburger SV",
						:acronym => "HSV")

team25 = Team.create(	:name => "Hertha BSC",
						:acronym => "HER")

team26 = Team.create(	:name => "1. FC Kaiserslautern",
						:acronym => "FCK")

team27 = Team.create(	:name => "1. FC Köln",
						:acronym => "KOL")

team28 = Team.create(	:name => "VfB Stuttgart",
						:acronym => "STG")

team29 = Team.create(	:name => "Borussia Dortmund",
						:acronym => "BVB")

team30 = Team.create(	:name => "Borussia Mönchengladbach",
						:acronym => "MGL")

team31 = Team.create(	:name => "FC Augsburg",
						:acronym => "FCA")

team32 = Team.create(	:name => "FC Schalke 04",
						:acronym => "S04")

team33 = Team.create(	:name => "Hannover 96",
						:acronym => "H96")

team34 = Team.create(	:name => "SC Freiburg",
						:acronym => "SCF")

Game.create(
			:round_id => round4.id,
			:kickoff => "04/20/2012 20:30",
			:home_team => team17.id,
			:away_team => team18.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 15:30",
			:home_team => team19.id,
			:away_team => team20.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 15:30",
			:home_team => team21.id,
			:away_team => team22.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 15:30",
			:home_team => team23.id,
			:away_team => team24.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 15:30",
			:home_team => team25.id,
			:away_team => team26.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 15:30",
			:home_team => team27.id,
			:away_team => team28.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/21/2012 18:30",
			:home_team => team29.id,
			:away_team => team30.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/22/2012 15:30",
			:home_team => team31.id,
			:away_team => team32.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "04/22/2012 17:30",
			:home_team => team33.id,
			:away_team => team34.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team26.id,
			:away_team => team29.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team18.id,
			:away_team => team21.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team20.id,
			:away_team => team33.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team24.id,
			:away_team => team17.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team19.id,
			:away_team => team23.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team22.id,
			:away_team => team28.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team34.id,
			:away_team => team27.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team30.id,
			:away_team => team31.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "04/28/2012 15:30",
			:home_team => team32.id,
			:away_team => team25.id
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