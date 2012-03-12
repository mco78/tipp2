class GamesController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht Spiele"
		@games = Game.all
	end

	def show
		@title = "Spiel anzeigen"
		@game = Game.find(params[:id])
	end

	def new
		@title = "Spiel anlegen"
		@game = Game.new
	end

	def edit
		@title = "Spiel bearbeiten"
		@game = Game.find(params[:id])
	end

	def create
		@game = Game.new(params[:game])

		if @game.save
			flash[:success] = "Game was successfully created."
			redirect_to @game
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def update
		@game = Game.find(params[:id])

		if @game.update_attributes(params[:game])
			flash[:success] = "Game updated"
			redirect_to @game
		else
			flash[:error] = "Error!"
			redirect_to :back
		end
	end

	def destroy
		Game.find(params[:id]).destroy
		flash[:success] = "Game deleted"
		redirect_to :back
	end

end
