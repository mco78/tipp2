 # -*- coding: utf-8 -*-
module BetsHelper

	def sum_points(user, games)
		p = 0
		games.each do |game|
			userbet = user.bets.where(:game_id => game.id).first
			unless userbet.nil?
				unless userbet.points.nil?
					p = p + userbet.points
				end
			end
		end
		return p
	end

end
