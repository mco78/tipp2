 # -*- coding: utf-8 -*-
class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
		@title = "Homepage"
		@games = Game.find(:all, :conditions => ["kickoff > ?", Time.now],
	 							:order => 'kickoff ASC', :limit => 9)
		if user_signed_in?
			@user = current_user
			if @user.community_id.nil?
				@posts = Post.where(:category => "News")
			else
				@community = Community.find(@user.community_id)
				@posts = Post.where(:category => ["News", "com" + @community.id.to_s])
			end
			@bets = @user.bets
		end
	end

	def admin
		@title = "Admin Übersicht"
	end

	def about
		@title = "Über das Projekt"
	end

	def rules
		@title = "Regeln"
	end

	def impressum
		@title = "Impressum"
	end

end
