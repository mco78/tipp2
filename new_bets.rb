user1 = User.find_by_username("test")
user2 = User.find_by_username("test2")
user3 = User.find_by_username("test3")

users = []
users << user1
users << user2
users << user3

round = Round.find(149)
games = round.games

games.each do |g|
	g.home_score = nil
	g.away_score = nil
	g.save
	
	users.each do |u|
		Bet.create(		:game_id => g.id,
						:user_id => u.id,
						:home_bet => rand(4),
						:away_bet => rand(4)
						)
	end
end
