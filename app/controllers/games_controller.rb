 # -*- coding: utf-8 -*-

class GamesController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht Spiele"

		if params[:round_id].nil?
			next_game = Game.where("kickoff >= ?", Time.now).first
			@round = Round.find(next_game.round_id)
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => next_game.round_id).order('kickoff ASC')
		else
			@round = Round.find(params[:round_id])
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => params[:round_id]).order('kickoff ASC')
		end
	end

	def show
		@title = "Spiel anzeigen"
		@game = Game.find(params[:id])
		@round = Round.find(@game.round_id)
		@cup = Cup.find(@round.cup_id)
	end

	def new
		@title = "Spiel anlegen"
		@cup = Cup.find(params[:cup_id])
		@round = Round.find(params[:round_id])
		@game = Game.new
		@teams = Team.all
	end

	def edit
		@title = "Spiel bearbeiten"
		@game = Game.find(params[:id])
		@round = Round.find(@game.round_id)
		@cup = Cup.find(@round.cup_id)
		@teams = Team.all
	end

	def create
		@game = Game.new(params[:game])

		if @game.save
			flash[:success] = "Spiel erfolgreich erstellt."
			redirect_to @game
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@game = Game.find(params[:id])

		if @game.update_attributes(params[:game])
			flash[:success] = "Spiel bearbeitet."
			redirect_to @game
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Game.find(params[:id]).destroy
		flash[:success] = "Spiel gelöscht"
		redirect_to :back
	end

	def result_index
		@title = "Ergebnisse eintragen"
		@games = Game.where( :home_score => nil).order(:kickoff).limit(36)
	end

	def fix_result
		@title = "Ergebnis eintragen"
		@game = Game.find(params[:id])
	end

	def save_result
		@game = Game.find(params[:id])
		@bets = Bet.find_all_by_game_id(@game.id)

		if @game.update_attributes(params[:game])
			flash[:success] = "Ergebnis eingetragen."
			# do some point-updating here
			@bets.each do |bet|
				p = points_per_game(@game.home_score, @game.away_score, bet.home_bet, bet.away_bet)
				bet.points = p
				bet.save
				flash[:success] = "Punkte verteilt."
			end
			# Spieltagszusammenfassung erstellen, wenn Spieltag vorbei
			if round_over(@game) == true
				post_round_summary(@game)
			end

			head = "#{Team.find(@game.home_team).name} - #{Team.find(@game.away_team).name} #{@game.home_score}:#{@game.away_score}"
			Post.create(:headline => head, :category => 'System', :content => '[System: Punkte verteilt.]')
			redirect_to result_index_games_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	private

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
