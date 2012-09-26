# -*- coding: utf-8 -*-
class Cup < ActiveRecord::Base

	has_many :rounds
	has_many :games, :through => :rounds
	has_many :teams

	validates :name,	:presence => true, :uniqueness => true

	def update_game_dates
		cup = self
		@messages = []
		@messages << "Starte automatische Aktualisierung der Anstoßzeiten!"
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_current_group, body: { "leagueShortcut" => cup.league_shortcut}
		data = data = response.to_hash[:get_current_group_response] [:get_current_group_result]
		
		current_round = Round.find_by_open_liga_id(data[:group_id])

		# aktuelle Runde und kommende 5 Runden in ein Array packen
		rounds = []
		rounds << current_round
		for i in 1..6
			round = Round.find_by_leg(current_round.leg+i)
			rounds << round
		end

		rounds.each do |round|

			games = round.games
			games.each do |game|
				response = client.request :web, :get_match_by_match_id, body: { "MatchID" => game.open_liga_id }
				data = data = response.to_hash[:get_match_by_match_id_response] [:get_match_by_match_id_result]
				if data[:match_date_time_utc] == game.kickoff
					@messages << "Spiel ID " + game.open_liga_id.to_s + ": Anstoßzeit aktuell."
				else
					game.kickoff = data[:match_date_time_utc]
					game.save
					@messages << "Spiel ID " + game.open_liga_id.to_s + " (" + Team.find(game.home_team).acronym + " - " + Team.find(game.away_team).acronym + "): Anstoßzeit akualisiert auf " + game.kickoff.strftime("%d.%m.%y %H:%M").to_s + "."
				end
			end
		end

		@messages << "Anstoßzeiten bis Runde " + rounds.last.leg.to_s + " aktualisiert."	 
	end

	def fix_current_results
		cup = self
		@messages = []
		@messages << "Starte Ergebniseintragung aktueller Spieltag"
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_current_group, body: { "leagueShortcut" => cup.league_shortcut}
		data = data = response.to_hash[:get_current_group_response] [:get_current_group_result]
		
		current_round = Round.find_by_open_liga_id(data[:group_id])
		fix_results(cup, current_round)
		return @messages
	end

	def fix_certain_results(current_round)
		cup = self
		@messages = []
		@messages << "Starte Ergebniseintragung Spieltag ID " + current_round.id.to_s
		fix_results(cup, current_round)
		return @messages
	end

	def fix_results(cup, current_round)
		@messages << "Wettbewerb: " + cup.name + ", Runde: " + current_round.name + " (Leg: " + current_round.leg.to_s + ", ID: " + current_round.id.to_s + ")"
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_matchdata_by_group_league_saison, 
			body: { "groupOrderID" => current_round.leg, "leagueShortcut" => cup.league_shortcut, "leagueSaison" => cup.league_season}
		data = data = response.to_hash[:get_matchdata_by_group_league_saison_response] [:get_matchdata_by_group_league_saison_result] [:matchdata]

		data.each do |match|
			game = Game.find_by_open_liga_id(match[:match_id])
			if game.nil?
				@messages << "Spiel in der Datenbank nicht gefunden. Keine Aktion durchgeführt."
			else
				@messages << Team.find(game.home_team).acronym + " - " + Team.find(game.away_team).acronym
				if match[:match_is_finished] === true
					if game.home_score.nil?
						game.home_score = match[:points_team1]
						game.away_score = match[:points_team2]
						game.save
						@messages << "Ergebnis eingetragen: " + game.home_score.to_s + ":" + game.away_score.to_s
						
						bets = Bet.find_all_by_game_id(game.id)
						bet_count = bets.count
						bets_fixed = 0
						
						bets.each do |bet|
							p = points_per_game(game.home_score, game.away_score, bet.home_bet, bet.away_bet)
							bet.points = p
							bet.save
							bets_fixed = bets_fixed + 1
						end

						#if bet_count === bets_fixed
						#	@messages << "Punkte bei " + bets_fixed + " Tipps verteilt."
						#else
							@messages << "Punkte bei " + bets_fixed.to_s + " von " + bet_count.to_s + " gefundenen Tipps verteilt."
						#end

						if round_over(game) === true
							post_round_summary(game)
						end

					else
						if match[:points_team1].to_i == game.home_score &&  match[:points_team2].to_i == game.away_score
							@messages << "Ergebnis ist bereits eingetragen."
						else
							@messages << "ACHTUNG: Spiel in Datenbank hat bereits Ergebnis, welches von dem Open-Liga-DB-Ergebnis abweicht! Manuell überprüfen!"
							# Nachricht über Konflikt an Admin
						end
					end
				else
					@messages << "Spiel noch nicht beendet."
				end
			end
		end
	end

	def testcron
		File.open("log/testcron.log", 'a+') {|f| f.write("Zeit: " + Time.now.to_s + " *** ")}
	end

	def round_over(game)
		round = Round.find(game.round_id)
		games = round.games
		open_game = 0
		games.each do |g|
			if g.away_score.nil?
				open_game = open_game + 1
			end
		end
		if open_game === 0
			return true
		else
			return false
		end
	end

	def points_per_game(home_score, away_score, home_bet, away_bet)
		if home_score == home_bet && away_score == away_bet #richtiges ergebnis
			return 3
		else
			if (home_score - away_score) - (home_bet - away_bet) == 0 #richtige differenz
				if home_score == away_score #bei unendschieden nur 1 punkt
					return 1
				else
					return 2
				end
			else
				if ((home_score - away_score) <=> 0) == ((home_bet - away_bet) <=> 0) #richtige tendenz
					return 1
				else
					return 0
				end
			end
		end
	end

	def post_round_summary(game)
		round = Round.find(game.round_id)
		games = round.games.order('kickoff ASC')
		result_table = get_result_table(games)

		@communities = Community.all #hier evt. später nur mitspielende Communities auswählen?
		@communities.each do |com|
			users = com.users
			bets_possible = games.count * users.count
			bets_count = 0
			games.each do |g|
				users.each do |u|
					bets_count = bets_count ++ u.bets.where(:game_id => g.id).count
				end
			end
			userranking = []
			users.each do |u|
				round_points = 0
				games.each do |g|
					bet = u.bets.where(:game_id => g.id).first
					unless bet.nil?
						unless bet.points.nil?
							round_points = round_points ++ bet.points
						end
					end
				end
				userranking.push({"user_id"=>u.id, "points"=>round_points})
			end

			# Inhalt für Community-Post
			head = round.name + " beendet"
			content = "Spieltag-Zusammenfassung für <strong>" + com.name + "</strong>:
			
			<strong>Ergebnisse:</strong>
			" 
			result_table.each do |r|
				content = content + " " + r + " 
				"
			end

			content = content + " 
				"
			content = content + bets_count.to_s + " von " + bets_possible.to_s + " möglichen Tipps abgegeben.
				
				"
			content = content + "<strong>Punkte für diesen Spieltag:</strong>
				"
			userranking.sort_by { |k| k["points"]}.reverse.each do |r|
				content = content + User.find(r["user_id"]).username + ": " + r["points"].to_s + "
				"
			end
			Post.create(:headline => head, :category => 'com' + com.id.to_s, :content => content)
		end
	end

	def get_result_table(games)
		result_table = Array.new
		games.each do |g|
			string = Team.find(g.home_team).name + " - " + Team.find(g.away_team).name + " " + g.home_score.to_s + ":" + g.away_score.to_s
			result_table.push(string)
		end
		return result_table
	end

	def self.auto_results
    	find_each {|cup| cup.auto_fix_current_results}
 	end

 	def auto_fix_current_results
 		puts "Starte Ergebniseintragung aktueller Spieltag"
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_current_group, body: { "leagueShortcut" => league_shortcut}
		data = data = response.to_hash[:get_current_group_response] [:get_current_group_result]
		
		@current_round = Round.find_by_open_liga_id(data[:group_id])
		
		#fix_results(cup, current_round)
		response = client.request :web, :get_matchdata_by_group_league_saison, 
			body: { "groupOrderID" => @current_round.leg, "leagueShortcut" => league_shortcut, "leagueSaison" => league_season}
		data = data = response.to_hash[:get_matchdata_by_group_league_saison_response] [:get_matchdata_by_group_league_saison_result] [:matchdata]

		data.each do |match|
			@game = Game.find_by_open_liga_id(match[:match_id])
			if @game.nil?
				puts "Spiel in der Datenbank nicht gefunden. Keine Aktion durchgeführt."
			else
				puts Team.find(@game.home_team).acronym + " - " + Team.find(@game.away_team).acronym
				if match[:match_is_finished] === true
					if @game.home_score.nil?
						@game.home_score = match[:points_team1]
						@game.away_score = match[:points_team2]
						@game.save
						puts "Ergebnis eingetragen: " + @game.home_score.to_s + ":" + @game.away_score.to_s
						
						@bets = Bet.find_all_by_game_id(game.id)
						@bet_count = @bets.count
						@bets_fixed = 0
						
						@bets.each do |bet|
							p = points_per_game(game.home_score, game.away_score, bet.home_bet, bet.away_bet)
							bet.points = p
							bet.save
							@bets_fixed = @bets_fixed + 1
						end

						puts "Punkte bei " + @bets_fixed.to_s + " von " + @bet_count.to_s + " gefundenen Tipps verteilt."

						if round_over(@game) === true
							post_round_summary(@game)
						end

					else
						if match[:points_team1].to_i == @game.home_score &&  match[:points_team2].to_i == @game.away_score
							puts "Ergebnis ist bereits eingetragen."
						else
							puts "ACHTUNG: Spiel in Datenbank hat bereits Ergebnis, welches von dem Open-Liga-DB-Ergebnis abweicht! Manuell überprüfen!"
							# Nachricht über Konflikt an Admin
						end
					end
				else
					puts "Spiel noch nicht beendet."
				end
			end
		end
 	end

 	def self.update_dates
	    find_each {|cup| cup.update_game_dates}
	end


end
