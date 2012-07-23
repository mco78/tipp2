 # -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Cup.delete_all

Game.delete_all

Round.delete_all

Team.delete_all

User.delete_all

Bet.delete_all

Community.delete_all

cup1 = Cup.create( :name => "Bundesliga 2012/2013" )

round1 = Round.create(	:name 	=> "1. Spieltag", 
						:leg 	=> 1, :cup_id => cup1.id)

round2 = Round.create(	:name 	=> "2. Spieltag",
						:leg 	=> 2,
						:cup_id => cup1.id)

team1 = Team.create(	:name 	=> "Borrussia Dortmund",
						:acronym => "BVB")

team2 = Team.create(	:name 	=> "Werder Bremen",
						:acronym => "WER")

team3 = Team.create(	:name 	=> "Borussia M'Gladbach",
						:acronym => "GLA")

team4 = Team.create(	:name 	=> "1899 Hoffenheim",
						:acronym => "HOF")

team5 = Team.create(	:name 	=> "SC Freiburg",
						:acronym => "SCF")

team6 = Team.create(	:name 	=> "1. FSV Mainz 05",
						:acronym => "MAI")

team7 = Team.create(	:name 	=> "FC Augsburg",
						:acronym => "FCA")

team8 = Team.create(	:name 	=> "Fortuna Düsseldorf",
						:acronym => "DÜS")

team9 = Team.create(	:name 	=> "Hamburger SV",
						:acronym => "HSV")

team10 = Team.create(	:name 	=> "1. FC Nürnberg",
						:acronym => "FCN")

team11 = Team.create(	:name 	=> "SpVgg Greuther Fürth",
						:acronym => "FÜR")

team12 = Team.create(	:name 	=> "Bayern München",
						:acronym => "BAY")

team13 = Team.create(	:name 	=> "Eintracht Frankfurt",
						:acronym => "FRA")

team14 = Team.create(	:name 	=> "Bayer Leverkusen",
						:acronym => "LEV")

team15 = Team.create(	:name 	=> "VfB Stuttgart",
						:acronym => "STU")

team16 = Team.create(	:name 	=> "VfL Wolfsburg",
						:acronym => "WOL")

team17 = Team.create(	:name 	=> "Hannover 96",
						:acronym => "H96")

team18 = Team.create(	:name 	=> "FC Schalke 04",
						:acronym => "S04")

game1 = Game.create(:round_id => round1.id,
			:kickoff => "24/08/2012 20:30",
			:home_team => team1.id,
			:away_team => team2.id
			)

game2 = Game.create(:round_id => round1.id,
			:kickoff => "25/08/2012 15:30",
			:home_team => team3.id,
			:away_team => team4.id
			)

game3 = Game.create(:round_id => round1.id,
			:kickoff => "25/08/2012 15:30",
			:home_team => team5.id,
			:away_team => team6.id
			)

game4 = Game.create(
			:round_id => round1.id,
			:kickoff => "25/08/2012 15:30",
			:home_team => team7.id,
			:away_team => team8.id
			)

game5 = Game.create(
			:round_id => round1.id,
			:kickoff => "25/08/2012 15:30",
			:home_team => team9.id,
			:away_team => team10.id
			)

game6 = Game.create(
			:round_id => round1.id,
			:kickoff => "25/08/2012 15:30",
			:home_team => team11.id,
			:away_team => team12.id
			)

game7 = Game.create(
			:round_id => round1.id,
			:kickoff => "25/08/2012 18:30",
			:home_team => team13.id,
			:away_team => team14.id
			)

game8 = Game.create(
			:round_id => round1.id,
			:kickoff => "26/08/2012 15:30",
			:home_team => team15.id,
			:away_team => team16.id
			)

game9 = Game.create(
			:round_id => round1.id,
			:kickoff => "26/08/2012 17:30",
			:home_team => team17.id,
			:away_team => team18.id
			)

#2. Spieltag

game10 = Game.create(
			:round_id => round2.id,
			:kickoff => "31/08/2012 20:30",
			:home_team => team6.id,
			:away_team => team11.id
			)

game11 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 15:30",
			:home_team => team18.id,
			:away_team => team7.id
			)

game12 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 15:30",
			:home_team => team14.id,
			:away_team => team5.id
			)

game13 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 15:30",
			:home_team => team2.id,
			:away_team => team9.id
			)

game14 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 15:30",
			:home_team => team10.id,
			:away_team => team1.id
			)

game15 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 15:30",
			:home_team => team4.id,
			:away_team => team13.id
			)

game16 = Game.create(
			:round_id => round2.id,
			:kickoff => "01/09/2012 18:30",
			:home_team => team8.id,
			:away_team => team3.id
			)

game17 = Game.create(
			:round_id => round2.id,
			:kickoff => "02/09/2012 15:30",
			:home_team => team16.id,
			:away_team => team17.id
			)

game18 = Game.create(
			:round_id => round2.id,
			:kickoff => "02/09/2012 17:30",
			:home_team => team12.id,
			:away_team => team15.id
			)

#Users

user1 = User.create( 	:username => "test",
						:email => "test@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user2 = User.create( 	:username => "test2",
						:email => "test2@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user3 = User.create( 	:username => "test3",
						:email => "test3@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user4 = User.create( 	:username => "test4",
						:email => "test4@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user5 = User.create( 	:username => "test5",
						:email => "test5@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user6 = User.create( 	:username => "test6",
						:email => "test6@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

user7 = User.create( 	:username => "test7",
						:email => "test7@test.com",
						:password => "testtest",
						:password_confirmation => "testtest")

bet1 = Bet.create(		:game_id => game1.id,
						:user_id => user1.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet2 = Bet.create(		:game_id => game1.id,
						:user_id => user2.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet3 = Bet.create(		:game_id => game1.id,
						:user_id => user3.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet4 = Bet.create(		:game_id => game1.id,
						:user_id => user4.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet5 = Bet.create(		:game_id => game1.id,
						:user_id => user5.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet6 = Bet.create(		:game_id => game1.id,
						:user_id => user6.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet7 = Bet.create(		:game_id => game1.id,
						:user_id => user7.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet8 = Bet.create(		:game_id => game2.id,
						:user_id => user1.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet9 = Bet.create(		:game_id => game2.id,
						:user_id => user2.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet10 = Bet.create(		:game_id => game2.id,
						:user_id => user3.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet11 = Bet.create(		:game_id => game2.id,
						:user_id => user4.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet12 = Bet.create(		:game_id => game2.id,
						:user_id => user5.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet13 = Bet.create(		:game_id => game2.id,
						:user_id => user6.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet14 = Bet.create(		:game_id => game2.id,
						:user_id => user7.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet15 = Bet.create(		:game_id => game3.id,
						:user_id => user1.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet16 = Bet.create(		:game_id => game3.id,
						:user_id => user2.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet17 = Bet.create(		:game_id => game3.id,
						:user_id => user3.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet18 = Bet.create(		:game_id => game3.id,
						:user_id => user4.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet19 = Bet.create(		:game_id => game3.id,
						:user_id => user5.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet20 = Bet.create(		:game_id => game3.id,
						:user_id => user6.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

bet21 = Bet.create(		:game_id => game3.id,
						:user_id => user7.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)

Bet.create(		:game_id => game4.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game4.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game4.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game4.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game4.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game4.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game4.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game5.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game5.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game5.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game5.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game5.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game5.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game5.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game6.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game6.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game6.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game6.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game6.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game6.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game6.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game7.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game7.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game7.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game7.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game7.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game7.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game7.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game8.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game8.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game8.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game8.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game8.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game8.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game8.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game9.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game9.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game9.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game9.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game9.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game9.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game9.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game10.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game10.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game10.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game10.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game10.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game10.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game10.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game11.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game11.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game11.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game11.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game11.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game11.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game11.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game12.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game12.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game12.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game12.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game12.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game12.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game12.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game13.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game13.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game13.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game13.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game13.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game13.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game13.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game14.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game14.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game14.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game14.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game14.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game14.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game14.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game15.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game15.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game15.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game15.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game15.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game15.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game15.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game16.id,
				:user_id => user1.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game16.id,
				:user_id => user2.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
					)

Bet.create(		:game_id => game16.id,
				:user_id => user3.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game16.id,
				:user_id => user4.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game16.id,
				:user_id => user5.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game16.id,
				:user_id => user6.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)

Bet.create(		:game_id => game16.id,
				:user_id => user7.id,
				:home_bet => rand(4),
				:away_bet => rand(4)
				)