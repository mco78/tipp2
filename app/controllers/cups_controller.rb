# -*- coding: utf-8 -*-
class CupsController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht Wettbewerbe"
		@cups = Cup.all
	end

	def new
		@title = "Wettbewerb erstellen"
		@cup = Cup.new
	end

	def edit
		@title = "Wettbewerb bearbeiten"
		@cup = Cup.find(params[:id])
	end

	def create
		@cup = Cup.new(params[:cup])

		if @cup.save
			flash[:success] = "Wettbewerb erfolgreich erstellt."
			redirect_to cups_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@cup = Cup.find(params[:id])

		if @cup.update_attributes(params[:cup])
			flash[:success] = "Wettbewerb bearbeitet."
			redirect_to cups_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		cup = Cup.find(params[:id])
		cuprounds = Round.where(:cup_id => cup.id)
		if cuprounds.empty?
			cup.destroy
			flash[:success] = "Cup gelöscht"
			redirect_to :back
		else
			flash[:warning] = "Für diesen Cup scheint es noch Spieltage im System zu geben, daher kann er nicht gelöscht werden!"
			redirect_to :back
		end
	end

	def automate
		@title = "Wettbewerb automatisieren"
		@cup = Cup.find(params[:id])
		@messages = []
		if params[:task] === "get_teams"
			get_teams(@cup)
		end
		if params[:task] === "get_rounds"
			get_rounds(@cup)
		end
		if params[:task] === "get_games"
			get_games(@cup)
		end
		if params[:task] === "update_game_dates"
			update_game_dates(@cup)
		end
		if params[:task] === "fix_current_results"
			fix_current_results(@cup)
		end
		if params[:task] === "fix_certain_results"
			round = @cup.rounds.find_by_leg(params[:round])
			fix_certain_results(@cup, round)
		end
	end

	private

	def get_teams(cup)
		@messages << "Starte automatische Teamerstellung für Wettbewerb..."
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_teams_by_league_saison, body: { "leagueShortcut" => cup.league_shortcut, "leagueSaison" => cup.league_season}
		data = data = response.to_hash[:get_teams_by_league_saison_response] [:get_teams_by_league_saison_result][:team]
		
		data.each do |team|
			existing_team = Team.find_by_name(team[:team_name])
			if existing_team.nil?
				Team.create(:name 	=> team[:team_name],
							:acronym => team[:team_name][0, 3].upcase,
							:open_liga_id => team[:team_id].to_i)
				@messages << "Team " + team[:team_name] + " neu erstellt!"
			else
				if existing_team.open_liga_id === team[:team_id].to_i
					@messages << "Team " + team[:team_name] + " mit openLigaID existiert schon."
				else
					if existing_team.open_liga_id.nil?
						existing_team.open_liga_id = team[:team_id].to_i
						existing_team.save
						@messages << "Team " + team[:team_name] + " existierte schon. openLigaID hinzugefügt (" + team[:team_id] + ")."
					else
						existing_team.open_liga_id = team[:team_id].to_i
						existing_team.save
						@messages << "Team " + team[:team_name] + " existierte schon. openLigaID aktualisiert (" + team[:team_id] + ")."
					end
				end					
			end
		end
		@messages << "Automatische Teamerstellung beendet."
	end

	def get_rounds(cup)
		@messages << "Starte automatische Rundenerstellung für Wettbewerb..."
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_avail_groups, body: { "leagueShortcut" => cup.league_shortcut, "leagueSaison" => cup.league_season}
		data = data = response.to_hash[:get_avail_groups_response] [:get_avail_groups_result][:group]
		data.each do |group|
			existing_round = Round.where(:cup_id => cup.id, :leg => group[:group_order_id]).first
			if existing_round.nil?
				Round.create(:name 	=> group[:group_name],
							:leg => group[:group_order_id].to_i,
							:cup_id => cup.id,
							:open_liga_id => group[:group_id].to_i)
				@messages << "Runde " + group[:group_name] + " neu erstellt!"
			else
				if existing_round.open_liga_id.nil?
					existing_round.open_liga_id = group[:group_id].to_i
					existing_round.save
					@messages << "Runde " + group[:group_name] + " existierte schon. openLigaID hinzugefügt (" + group[:group_id] + ")."
				else
					existing_round.open_liga_id = group[:group_id].to_i
					existing_round.save
					@messages << "Runde " + group[:group_name] + " existierte schon. openLigaID aktualisiert (" + group[:group_id] + ")."
				end
			end
		end
		@messages << "Automatische Rundenerstellung abgeschlossen."	
	end

	def get_games(cup)
		@messages << "Starte automatische Spielerstellung für Wettbewerb..."
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_matchdata_by_league_saison, body: { "leagueShortcut" => cup.league_shortcut, "leagueSaison" => cup.league_season}
		data = data = response.to_hash[:get_matchdata_by_league_saison_response] [:get_matchdata_by_league_saison_result][:matchdata]
		data.each do |match|
			match[:home_team_id] = Team.find_by_open_liga_id(match[:id_team1]).id
			match[:away_team_id] = Team.find_by_open_liga_id(match[:id_team2]).id
			existing_game = Game.where(:kickoff => match[:match_date_time_utc].in_time_zone("Berlin"), :home_team => match[:home_team_id], :away_team => match[:away_team_id]).first
			if existing_game.nil?
				Game.create(:round_id => Round.find_by_open_liga_id(match[:group_id].to_i).id,
							:kickoff => match[:match_date_time_utc].in_time_zone("Berlin"),
							:home_team => match[:home_team_id], 
							:away_team => match[:away_team_id],
							:open_liga_id => match[:match_id].to_i)
				@messages << "Spiel " + match[:name_team1] + " - " + match[:name_team2] + " in Runde " + match[:group_name] + " neu erstellt!"
			else
				if existing_game.open_liga_id.nil?
					existing_game.open_liga_id = match[:match_id].to_i
					existing_game.save
					@messages << "Spiel " + match[:name_team1] + " - " + match[:name_team2] + " in Runde " + match[:group_name] + " existierte schon. openLigaID hinzugefügt (" + match[:match_id] + ")."
				else
					if existing_game.open_liga_id == match[:match_id].to_i
						@messages << "Spiel " + match[:name_team1] + " - " + match[:name_team2] + " in Runde " + match[:group_name] + " existiert schon. openLigaID ist aktuell."
					else
						existing_game.open_liga_id = match[:match_id].to_i
						existing_game.save
						@messages << "Spiel " + match[:name_team1] + " - " + match[:name_team2] + " in Runde " + match[:group_name] + " existierte schon. openLigaID aktualisiert (" + match[:match_id] + ")."
					end
				end
			end
		end
		@messages << "Automatische Spielgenerierung abgeschlossen."	
	end

	def update_game_dates(cup)
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

	def fix_current_results(cup)
		@messages << "Starte Ergebniseintragung aktueller Spieltag"
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		response = client.request :web, :get_current_group, body: { "leagueShortcut" => cup.league_shortcut}
		data = data = response.to_hash[:get_current_group_response] [:get_current_group_result]
		
		current_round = Round.find_by_open_liga_id(data[:group_id])
		@messages << "Wettbewerb: " + cup.name + ", Runde: " + current_round.name + " (Leg: " + current_round.leg.to_s + ", ID: " + current_round.id.to_s + ")"

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

	def fix_certain_results(cup, round)
		@messages << "Starte Ergebniseintragung Spieltag ID " + round.id.to_s
		client = Savon::Client.new("http://www.openligadb.de/Webservices/Sportsdata.asmx?WSDL")
		
		current_round = round
		@messages << "Wettbewerb: " + cup.name + ", Runde: " + current_round.name + " (Leg: " + current_round.leg.to_s + ", ID: " + current_round.id.to_s + ")"

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
end
