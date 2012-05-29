 # -*- coding: utf-8 -*-
class UsersController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht User"
		@users = User.all.sort_by { |u| [u.last_sign_in_at ? 1 : 0, u.last_sign_in_at] }
	end


	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User gelöscht"
		redirect_to :back
	end
end
