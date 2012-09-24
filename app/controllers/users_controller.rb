 # -*- coding: utf-8 -*-
class UsersController < ApplicationController

	before_filter :authenticate_admin!, :only => [:index, :destroy]
	
	def index
		@title = "Übersicht User"
		@users = User.all.sort_by { |u| [u.current_sign_in_at ? 1 : 0, u.current_sign_in_at] }
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User gelöscht"
		redirect_to :back
	end

	def show
		@user = User.find(params[:id])
		@points_per_bet = points_per_bet(@user)
	end

	private

	def points_per_bet(user)
		bets = user.bets
		bet_count = user.bets.count
		points = 0
		bets.each do |bet|
			unless bet.points.nil?
				points = points ++ bet.points
			end
		end
		average_points = points.to_f / bet_count
		return '%.4f' % average_points
	end

end
