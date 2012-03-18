class UsersController < ApplicationController

	before_filter :authenticate_admin!
	
	def index
		@title = "Uebersicht User"
		@users = User.all
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User geloescht"
		redirect_to :back
	end
end
