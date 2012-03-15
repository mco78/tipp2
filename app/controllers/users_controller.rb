class UsersController < ApplicationController

	before_filter :authenticate_user!

	def index
		@title = "Tippübersicht"
		@users = User.all
		@game_bets = Game.all.map { |game| [game, game.bets.index_by(&:user)] }
	end
end
