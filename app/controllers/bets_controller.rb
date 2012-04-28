 # -*- coding: utf-8 -*-
class BetsController < ApplicationController

	before_filter :authenticate_user!

	def abgabe
		@title = "Tippabgabe"
		@user = current_user
		@bets = @user.bets

		if params[:cup_id].nil?
			if params[:round_id].nil?
				@round = get_current_round
			else
				@round = Round.find(params[:round_id])
			end
			@cup = Cup.find(@round.cup_id)
		else
			@cup = Cup.find(params[:cup_id])
			if params[:round_id].nil?
				@round = get_current_cup_round
			else
				if Round.find(params[:round_id]).cup_id != @cup.id
					@round = get_current_cup_round
				else
					@round = @round = Round.find(params[:round_id])
				end
			end
		end

		@cup_options = Cup.all
		@round_options = @cup.rounds
		@games = @round.games
		@bet = Bet.new

		if Round.where(:leg => @round.leg+1).nil?
			@nextround = nil
		else
			@cuprounds = @cup.rounds
			nextleg = @round.leg+1
			@nextround = @cuprounds.where(:leg => nextleg).first
		end

		if Round.where(:leg => @round.leg-1).nil?
			@previousround = nil
		else
			@cuprounds = @cup.rounds
			previousleg = @round.leg-1
			@previousround = @cuprounds.where(:leg => previousleg).first
		end
	end

	def index
		@title = "Tippübersicht"
		@users = User.all

		if params[:cup_id].nil?
			if params[:round_id].nil?
				@round = get_current_round
			else
				@round = Round.find(params[:round_id])
			end
			@cup = Cup.find(@round.cup_id)
		else
			@cup = Cup.find(params[:cup_id])
			if params[:round_id].nil?
				@round = get_current_cup_round
			else
				if Round.find(params[:round_id]).cup_id != @cup.id
					@round = get_current_cup_round
				else
					@round = @round = Round.find(params[:round_id])
				end
			end
		end

		@cup_options = Cup.all
		@round_options = @cup.rounds
		@games = @round.games
		@game_bets = @games.map { |game| [game, game.bets.index_by(&:user)] }

		if Round.where(:leg => @round.leg+1).nil?
			@nextround = nil
		else
			@cuprounds = @cup.rounds
			nextleg = @round.leg+1
			@nextround = @cuprounds.where(:leg => nextleg).first
		end

		if Round.where(:leg => @round.leg-1).nil?
			@previousround = nil
		else
			@cuprounds = @cup.rounds
			previousleg = @round.leg-1
			@previousround = @cuprounds.where(:leg => previousleg).first
		end
	end

	def new
		@title = "Tipp abgeben"
		@bet = Bet.new
		@game = Game.find(params[:game_id])

		if Time.now >= @game.kickoff
			flash[:error] = "Spiel hat bereits begonnen!"
			redirect_to :back
		end
	end

	def create

		@bet = current_user.bets.build(params[:bet])

		if @bet.save
			redirect_to :back
			flash[:success] = "Tipp abgegeben."
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def edit
		@bet = Bet.find(params[:id])
		@game = Game.find(params[:game_id])

		if Time.now >= @game.kickoff
			flash[:error] = "Spiel hat bereits begonnen!"
			redirect_to :back
		end
	end

	def update
		@bet = Bet.find(params[:id])

		if @bet.update_attributes(params[:bet])
			flash[:success] = "Tipp geändert."
			redirect_to :back
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Bet.find(params[:id]).destroy
		flash[:success] = "Tipp gelöscht."
		redirect_to :back
	end

	

	private

	def get_current_round
	 	@upcoming = Game.find(	:all, :conditions => ["kickoff > ?", Time.now],
	 							:order => 'kickoff ASC')
	 	if @upcoming.count == 0
	 		last_game = Game.find(:all, :order => 'kickoff ASC').last
	 		return Round.find(last_game.round_id)
	 	end

	 	return Round.find(@upcoming.first.round_id)
	end

	def get_current_cup_round
		upcoming_cup_games = @cup.games.find(:all, :conditions => ["kickoff > ?", Time.now],
	 							:order => 'kickoff ASC')
		if upcoming_cup_games.count == 0
			cup_rounds = @cup.rounds.order('leg ASC')
			return cup_rounds.last
		else
			next_game = upcoming_cup_games.first
			return Round.find(next_game.round_id)
		end
	end

end
