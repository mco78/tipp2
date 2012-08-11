# -*- coding: utf-8 -*-
class TeamsController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht Teams"
		@teams = Team.all
	end

	def show
		@title = "Team anzeigen"
		@team = Team.find(params[:id])
	end

	def new
		@title = "Team erstellen"
		@team = Team.new
	end

	def edit
		@title = "Team bearbeiten"
		@team = Team.find(params[:id])
	end

	def create
		@team = Team.new(params[:team])

		if @team.save
			flash[:success] = "Team erfolgreich erstellt."
			redirect_to teams_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@team = Team.find(params[:id])

		if @team.update_attributes(params[:team])
			flash[:success] = "Team bearbeitet."
			redirect_to teams_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		team = Team.find(params[:id])
		homegames = Game.where(:home_team => team.id)
		awaygames = Game.where(:away_team => team.id)
		if homegames.empty? && awaygames.empty?
			team.destroy
			flash[:success] = "Team gelöscht"
			redirect_to :back
		else
			flash[:warning] = "Für das Team scheint es noch Spiele im System zu geben, daher kann es nicht gelöscht werden!"
			redirect_to :back
		end
	end
end
