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
			@messages = @cup.update_game_dates
		end
		if params[:task] === "fix_current_results"
			@messages = @cup.fix_current_results
		end
		if params[:task] === "fix_certain_results"
			round = @cup.rounds.find_by_leg(params[:round])
			@messages = @cup.fix_certain_results(round)
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
							:acronym => group[:group_name][0, 2],
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

	

end
