 # -*- coding: utf-8 -*-
class PostsController < ApplicationController

	before_filter :authenticate_admin!, :except => [:show, :news, :new_userpost, :create, :edit, :update]


	def index
		@title = "Übersicht Posts"
		@posts = Post.paginate(page: params[:page])
	end

	def news
		@title = "Neuigkeiten"
		@posts = Post.news.all
	end

	def show
		@title = "Post anzeigen"
		@post = Post.find(params[:id])
	end

	def new
		@title = "Post erstellen"
		@post = Post.new
	end

	def new_userpost
		@title = "Post erstellen"
		@user = current_user
		@community = Community.find(@user.community_id)
		@post = Post.new
	end		

	def edit
		@title = "Post bearbeiten"
		@post = Post.find(params[:id])
		@user = current_user
		@community = Community.find(@user.community_id)
	end	

	def create
		@post = Post.new(params[:post])

		if @post.save
			flash[:success] = "Post erfolgreich erstellt."
			redirect_to root_path
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			flash[:success] = "Post bearbeitet."
			redirect_to @post
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "Post gelöscht"
		redirect_to :back
	end
end
