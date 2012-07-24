 # -*- coding: utf-8 -*-
class BetsController < ApplicationController

	before_filter :authenticate_user!

	def abgabe
		@title = "Tippabgabe"
		@user = current_user
		@bets = @user.bets

		if params[:cup_id].nil?
			if params[:round_id].nil?
				@round = get_current_round
			else
				@round = Round.find(params[:round_id])
			end
			@cup = Cup.find(@round.cup_id)
		else
			@cup = Cup.find(params[:cup_id])
			if params[:round_id].nil?
				@round = get_current_cup_round
			else
				if Round.find(params[:round_id]).cup_id != @cup.id
					@round = get_current_cup_round
				else
					@round = @round = Round.find(params[:round_id])
				end
			end
		end

		@cup_options = Cup.all
		@round_options = @cup.rounds
		@games = @round.games.order('kickoff ASC')
		@bet = Bet.new

		if Round.where(:leg => @round.leg+1).nil?
			@nextround = nil
		else
			@cuprounds = @cup.rounds
			nextleg = @round.leg+1
			@nextround = @cuprounds.where(:leg => nextleg).first
		end

		if Round.where(:leg => @round.leg-1).nil?
			@previousround = nil
		else
			@cuprounds = @cup.rounds
			previousleg = @round.leg-1
			@previousround = @cuprounds.where(:leg => previousleg).first
		end
	end

	def index
		@title = "Tippübersicht"
		if current_user.community_id.nil?
			@user = current_user
		else
		@community = Community.find(current_user.community_id)
		@users = User.where(:community_id => @community.id)
		end

		if params[:cup_id].nil?
			if params[:round_id].nil?
				@round = get_current_round
			else
				@round = Round.find(params[:round_id])
			end
			@cup = Cup.find(@round.cup_id)
		else
			@cup = Cup.find(params[:cup_id])
			if params[:round_id].nil?
				@round = get_current_cup_round
			else
				if Round.find(params[:round_id]).cup_id != @cup.id
					@round = get_current_cup_round
				else
					@round = @round = Round.find(params[:round_id])
				end
			end
		end

		@users_round_points = get_users_round_points(@users, @round)
		@cup_options = Cup.all
		@round_options = @cup.rounds
		@games = @round.games.order('kickoff ASC')
		@game_bets = @games.map { |game| [game, game.bets.index_by(&:user)] }

		if Round.where(:leg => @round.leg+1).nil?
			@nextround = nil
		else
			@cuprounds = @cup.rounds
			nextleg = @round.leg+1
			@nextround = @cuprounds.where(:leg => nextleg).first
		end

		if Round.where(:leg => @round.leg-1).nil?
			@previousround = nil
		else
			@cuprounds = @cup.rounds
			previousleg = @round.leg-1
			@previousround = @cuprounds.where(:leg => previousleg).first
		end
	end

	def ranking
		@title = "Ranking"
		unless current_user.community_id.nil?
			@community = Community.find(current_user.community_id)
		end

		@cup_options = Cup.all
		if params[:cup_id].nil?
			current_round = get_current_round
			@cup = Cup.find(current_round.cup_id)
		else
			@cup = Cup.find(params[:cup_id])
		end

		@rounds = get_active_rounds(@cup).sort! { |a, b| a.leg <=> b.leg }
		#hier active_rounds filtern -> runden in denen schon punkte verteilt wurden
		if current_user.community_id.nil?
			@user = current_user
			@cup_points = get_ranking_one(@user, @cup)
		else
			@users = User.where(:community_id => @community.id)
			@rankingusers = get_ranking(@users, @cup)
		end
		
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
			redirect_to :back
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
			redirect_to :back
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
	 		last_game = Game.find(:all, :order => 'kickoff ASC').last
	 		return Round.find(last_game.round_id)
	 	end

	 	return Round.find(@upcoming.first.round_id)
	end

	def get_current_cup_round
		upcoming_cup_games = @cup.games.find(:all, :conditions => ["kickoff > ?", Time.now],
	 							:order => 'kickoff ASC')
		if upcoming_cup_games.count == 0
			cup_rounds = @cup.rounds.order('leg ASC')
			return cup_rounds.last
		else
			next_game = upcoming_cup_games.first
			return Round.find(next_game.round_id)
		end
	end

	def get_ranking(users, cup)
		userranking = Hash.new {|h,k| h[k] = []}
		users.each do |user|
			cup_points = 0
			rounds = cup.rounds
			rounds.each do |round|
				unless round.nil?
					round_points = 0
					bets = round.bets.where(:user_id => user.id)
					bets.each do |bet|
						unless bet.nil?
							unless bet.points.nil?
								round_points = round_points ++ bet.points
							end
						end
					end
					cup_points = cup_points ++ round_points
				end
			end
			userranking[user.id] << cup_points
		end
		return userranking
	end

	def get_ranking_one(user, cup)
		cup_points = 0
		rounds = cup.rounds
		rounds.each do |round|
			unless round.nil?
				round_points = 0
				bets = round.bets.where(:user_id => user.id)
				bets.each do |bet|
					unless bet.nil?
						unless bet.points.nil?
							round_points = round_points ++ bet.points
						end
					end
				end
				cup_points = cup_points ++ round_points
			end
		end
		return cup_points
	end

	def get_active_rounds(cup)
		rounds = cup.rounds
		active_rounds = []
		rounds.each do |r|
			games = r.games
			finished_games = 0
			games.each do |g|
				unless g.away_score.nil?
					finished_games = finished_games + 1
				end
			end
			unless finished_games == 0
				active_rounds.push(r)
			end
		end
		return active_rounds
	end

	def get_users_round_points(users, round)
		games = round.games
		users_round_points = []
		users.each do |u|
			user_points = sum_points(u, games)
			users_round_points.push({"user_id"=>u.id, "points"=>user_points})
		end
		return users_round_points
	end

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
