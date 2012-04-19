 # -*- coding: utf-8 -*-
class BetsController < ApplicationController

	before_filter :authenticate_user!

	def abgabe
		@title = "Tippabgabe"
		@user = current_user
		@bets = @user.bets

		if params[:cup_id].nil?
			@cup = Cup.last
		else
			@cup = Cup.find(params[:cup_id])
		end

		if params[:round_id].nil?
			@round = get_current_round
			@games = Game.where(:round_id => @round.id)
		else
			@round = Round.find(params[:round_id])
			@games = Game.where(:round_id => params[:round_id])
		end

		# warum funktioniert diese Version nicht?
		# unless Round.where(:cup_id => @round.cup_id, :leg => @round.leg+1).nil?
		# 	@nextround = Round.where(:cup_id => @round.cup_id, :leg => @round.leg+1)
		# end

		# unless Round.where(:cup_id => @round.cup_id, :leg => @round.leg-1).nil?
		# 	@previousround = Round.where(:cup_id => @round.cup_id, :leg => @round.leg-1)
		# end


	end

	def index
		@title = "Tippübersicht"
		@users = User.all
		@game_bets = Game.all.map { |game| [game, game.bets.index_by(&:user)] }
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
			redirect_to abgabe_path
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
			redirect_to abgabe_path
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
	 		last_game = Game.last
	 		return Round.find(last_game.round_id)
	 	end

	 	return Round.find(@upcoming.first.round_id)
	end

end
