class UsersController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Übersicht User"
		@users = User.all
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User gelöscht"
		redirect_to :back
	end
end
