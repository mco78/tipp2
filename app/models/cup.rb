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
end
