class RoundsController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Spieltage"
		@cup = Cup.find(params[:cup_id])
		@rounds = Round.where( :cup_id => @cup.id).order("leg")
	end

	def show
		#safe round somewere and call game index
	end

	def new
		@title = "Spieltag erstellen"
		@cup = Cup.find(params[:cup_id])
		@round = Round.new
	end

	def edit
		@title = "Spieltag bearbeiten"
		@cup = Cup.find(params[:cup_id])
		@round = Round.find(params[:id])
	end

	def create
		@round = Round.new(params[:round])
		@cup = Cup.find(params[:cup_id])

		if @round.save
			flash[:success] = "Spieltag erfolgreich erstellt."
			redirect_to cup_rounds_url(@cup)
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@round = Round.find(params[:id])
		@cup = Cup.find(params[:cup_id])

		if @round.update_attributes(params[:round])
			flash[:success] = "Spieltag bearbeitet."
			redirect_to cup_rounds_url(@cup)
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Round.find(params[:id]).destroy
		flash[:success] = "Spieltag gelöscht"
		redirect_to :back
	end

end
