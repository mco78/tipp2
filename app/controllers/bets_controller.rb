class BetsController < ApplicationController

	before_filter :authenticate_user!

	def abgabe
		@title = "Tippabgabe"
		@user = current_user
		@games = Game.all
		@bets = @user.bets
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
			flash[:success] = "Tipp geaendert."
			redirect_to abgabe_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Bet.find(params[:id]).destroy
		flash[:success] = "Tipp geloescht."
		redirect_to :back
	end

end