 # -*- coding: utf-8 -*-
module BetsHelper

	def sum_points(user, bets)
		p = 0
		user.bets.each do |bet|
			if bet.points.nil?
				p = p + 0
			else
				p = p + bet.points
			end
		end
		return p
	end
end
