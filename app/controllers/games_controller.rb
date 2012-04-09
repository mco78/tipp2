 # -*- coding: utf-8 -*-

class GamesController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht Spiele"

		if params[:round_id].nil?
			next_game = Game.where("kickoff >= ?", Time.now).first
			@round = Round.find(next_game.round_id)
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => next_game.round_id)
		else
			@round = Round.find(params[:round_id])
			@cup = Cup.find(@round.cup_id)
			@games = Game.where(:round_id => params[:round_id])
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
	end

	def edit
		@title = "Spiel bearbeiten"
		@game = Game.find(params[:id])
		@round = Round.find(@game.round_id)
		@cup = Cup.find(@round.cup_id)
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
		@games = Game.where( :homescore => nil).order(:kickoff)
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
				p = points_per_game(@game.homescore, @game.awayscore, bet.home_bet, bet.away_bet)
				bet.points = p
				bet.save
				flash[:success] = "Punkte verteilt."
			end
			head = "#{@game.hometeam} - #{@game.awayteam} #{@game.homescore}:#{@game.awayscore}"
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

end
