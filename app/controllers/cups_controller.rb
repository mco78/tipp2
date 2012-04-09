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
			redirect_to @cup
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@cup = Cup.find(params[:id])

		if @cup.update_attributes(params[:cup])
			flash[:success] = "Wettbewerb bearbeitet."
			redirect_to @cup
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Cup.find(params[:id]).destroy
		flash[:success] = "Wettbewerb gelöscht"
		redirect_to :back
		#hier muessten eigentlich auch alle zugehörige runden und games gelöscht werden
	end
end
