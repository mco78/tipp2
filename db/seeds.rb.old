 # -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Bet.delete_all

Cup.delete_all

Game.delete_all

Post.delete_all

Round.delete_all

Team.delete_all

User.delete_all

cup1 = Cup.create( :name => "EM2012" )

round1 = Round.create(	:name 	=> "Vorrunde, 1. Spt.", :leg 	=> 1, :cup_id => cup1.id)

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

game1 = Game.create(:round_id => round1.id,
			:kickoff => "11/05/2012 18:00",
			:home_team => team1.id,
			:away_team => team2.id
			)

game2 = Game.create(:round_id => round1.id,
			:kickoff => "11/05/2012 20:45",
			:home_team => team3.id,
			:away_team => team4.id
			)

game3 = Game.create(:round_id => round1.id,
			:kickoff => "11/05/2012 18:00",
			:home_team => team5.id,
			:away_team => team6.id
			)

game4 = Game.create(
			:round_id => round1.id,
			:kickoff => "11/05/2012 20:45",
			:home_team => team7.id,
			:away_team => team8.id
			)

game5 = Game.create(
			:round_id => round1.id,
			:kickoff => "11/05/2012 18:00",
			:home_team => team9.id,
			:away_team => team10.id
			)

game6 = Game.create(
			:round_id => round1.id,
			:kickoff => "11/05/2012 21:45",
			:home_team => team11.id,
			:away_team => team12.id
			)

game7 = Game.create(
			:round_id => round1.id,
			:kickoff => "11/05/2012 18:00",
			:home_team => team13.id,
			:away_team => team14.id
			)

game8 = Game.create(
			:round_id => round1.id,
			:kickoff => "11/05/2012 20:45",
			:home_team => team15.id,
			:away_team => team16.id
			)

game9 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 18:00",
			:home_team => team2.id,
			:away_team => team4.id
			)

game10 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 20:45",
			:home_team => team1.id,
			:away_team => team3.id
			)

game11 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 18:00",
			:home_team => team6.id,
			:away_team => team8.id
			)

game12 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 20:45",
			:home_team => team5.id,
			:away_team => team7.id
			)

game13 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 18:00",
			:home_team => team10.id,
			:away_team => team12.id
			)

game14 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 20:45",
			:home_team => team9.id,
			:away_team => team11.id
			)

game15 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 18:00",
			:home_team => team15.id,
			:away_team => team13.id
			)

game16 = Game.create(
			:round_id => round2.id,
			:kickoff => "12/05/2012 20:45",
			:home_team => team16.id,
			:away_team => team14.id
			)

game17 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team4.id,
			:away_team => team1.id
			)

game18 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team2.id,
			:away_team => team3.id
			)

game19 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team8.id,
			:away_team => team5.id
			)

game20 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team6.id,
			:away_team => team7.id
			)


game21 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team12.id,
			:away_team => team9.id
			)

game22 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team10.id,
			:away_team => team11.id
			)

game23 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team14.id,
			:away_team => team15.id
			)

game24 = Game.create(
			:round_id => round3.id,
			:kickoff => "15/05/2012 20:45",
			:home_team => team16.id,
			:away_team => team13.id
			)

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

cup2 = Cup.create(:name => "Bundesliga 2012/2013")

round4 = Round.create(	:name => "01. Spieltag",
						:leg => 1,
						:cup_id => cup2.id)

round5 = Round.create(	:name => "02. Spieltag",
						:leg => 2,
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
			:kickoff => "20/08/2012 20:30",
			:home_team => team17.id,
			:away_team => team18.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 15:30",
			:home_team => team19.id,
			:away_team => team20.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 15:30",
			:home_team => team21.id,
			:away_team => team22.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 15:30",
			:home_team => team23.id,
			:away_team => team24.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 15:30",
			:home_team => team25.id,
			:away_team => team26.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 15:30",
			:home_team => team27.id,
			:away_team => team28.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "21/08/2012 18:30",
			:home_team => team29.id,
			:away_team => team30.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "22/08/2012 15:30",
			:home_team => team31.id,
			:away_team => team32.id
			)

Game.create(
			:round_id => round4.id,
			:kickoff => "22/08/2012 17:30",
			:home_team => team33.id,
			:away_team => team34.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team26.id,
			:away_team => team29.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team18.id,
			:away_team => team21.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team20.id,
			:away_team => team33.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team24.id,
			:away_team => team17.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team19.id,
			:away_team => team23.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team22.id,
			:away_team => team28.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team34.id,
			:away_team => team27.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
			:home_team => team30.id,
			:away_team => team31.id
			)

Game.create(
			:round_id => round5.id,
			:kickoff => "28/08/2012 15:30",
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