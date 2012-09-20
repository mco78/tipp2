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

end
