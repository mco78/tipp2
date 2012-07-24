# encoding: UTF-8
class CommunitiesController < ApplicationController
	#ACHTUNG: Wer kann was wann sehen? Authenticate 
	#nochmal überarbeiten
	before_filter :authenticate_admin!, :only => [:index]
	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :join, :leave, :invite] 
	before_filter :authenticate_any!, :only => [:show, :destroy]


	def index
		@title = "Übersicht Communities"
		@communities = Community.all
	end

	def new
		@title = "Community erstellen"
		@user = current_user
		@community = Community.new
	end

	def show
		@title = "Community Ansicht"
		@community = Community.find(params[:id])
		@admin = User.find(@community.admin_id)
		@members = User.where(:community_id => @community.id)
	end

	def edit
		@title = "Community bearbeiten"
		@user = current_user
		@community = Community.find(params[:id])
		if @community.admin_id != @user.id
			flash[:error] = "Community darf nur vom Administrator bearbeitet werden!"
			redirect_to root_path
		end
	end

	def invite
		@user = current_user
		@community = Community.find(current_user.community_id)
		unless params[:address].nil?
			@address = params[:address]
			CommunityMailer.community_invitation(@address, @user, @community).deliver
			flash[:success] = "E-Mail Einladung an " + @address + " versendet."
		end
	end 


	def create
		@community = Community.new(params[:community])
		@user = current_user

		if @community.save
			@user.community_id = @community.id
			@user.save
			flash[:success] = "Community erfolgreich erstellt."
			redirect_to @community
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@community = Community.find(params[:id])
		if @community.name_changed?
			@name_change = true
		end
		if @community.password_changed?
			@password_change = true
		end
		if @community.update_attributes(params[:community])
			flash[:success] = "Community bearbeitet."
			if @name_change = true
				Post.create(headline: "Name der Community geändert", 
							category: "com" + @community.id.to_s, 
							content: "Der Admin der Community hat den Namen der Community geändert. Die Community heißt nun " + @community.name + ".")
			end
			if @password_change = true
				Post.create(headline: "Passwort der Community geändert", 
							category: "com" + @community.id.to_s, 
							content: "Der Admin der Community hat das Passwort der Community geändert. Das neue Passwort ist " + @community.password + ". Das Passwort wird benötigt, um der Community beizutreten.")
			end
			redirect_to @community
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		@community = Community.find(params[:id])
		@users = @community.users
		@users.each do |user|
			user.community_id = nil
			user.save
		end
		@community.destroy
		flash[:success] = "Community gelöscht"
		redirect_to root_path
	end

	def join
		@user = current_user
		if params[:com_search].nil?
			@community = nil
		else
			@community =  Community.find_by_name(params[:com_search])
		end
		@password = params[:pass]
		unless params[:com_search].nil?
			if @community.nil?
				flash[:error] = "Community nicht gefunden!"
				redirect_to :back
			else
				unless @password.nil?
					if @password === @community.password
						@user.community_id = @community.id
						@user.save
						flash[:success] = "Community beigetreten!"
						Post.create(	headline: "Neuer Mitspieler", 
										category: "com" + @community.id.to_s,
										content: @user.username + " ist der Community beigetreten. Herzlich Willkommen!")
						redirect_to root_path
					else
						flash[:error] = "Name und Passwort der Community passen nicht zusammen"
						redirect_to :back
					end
				end
			end
		end
	end

	def leave
		@user = current_user
		@community = Community.find(@user.community_id)
		if @user.id === @community.admin_id
			if @community.users.count < 2
				@community.destroy
				@user.community_id = nil
				@user.save
				flash[:success] = "Community gelöscht!"
				redirect_to root_path
			else
				@user.community_id = nil
				@user.save
				@new_admin = @community.users.first
				@community.admin_id = @new_admin.id
				@community.save
				flash[:success] = "Aus Community ausgetreten!"
				Post.create(	headline: "Admin ausgetreten", 
								category: "com" + @community.id.to_s,
								content: @user.username + " hat die Community verlassen. Da " + @user.username + " der Admin der Community war, musste ein neuer Admin bestimmt werden. Neuer Community-Admin ist " + @new_admin.username + ".")
				redirect_to root_path
			end
		else
			@user.community_id = nil
			@user.save
			flash[:success] = "Aus Community ausgetreten!"
			Post.create(	headline: "Mitspieler ausgetreten", 
							category: "com" + @community.id.to_s,
							content: @user.username + " hat die Community verlassen.")
			redirect_to root_path
		end
	end

	def kick_out
		@community = Community.find(current_user.community_id)
		if current_user.id === @community.admin_id
			@user = User.find(params[:user_id])
			@user.community_id = nil
			@user.save
			flash[:success] = @user.username + " aus der Community rausgeworfen!"
			Post.create(	headline: "Mitspieler rausgeworfen", 
							category: "com" + @community.id.to_s,
							content: @user.username + " wurde vom Admin aus der Community geworfen.")
			redirect_to @community
		else
			flash[:error] = "Du hast nicht die Rechte, jemanden aus der Community zu werfen!"
			redirect_to @community
		end
	end
end
