class PostsController < ApplicationController

	before_filter :authenticate_admin!, :except => [:show, :news]
	
	def index
		@title = "Uebersicht Posts"
		@posts = Post.all
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

	def edit
		@title = "Post bearbeiten"
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])

		if @post.save
			flash[:success] = "Post erfolgreich erstellt."
			redirect_to @post
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
		flash[:success] = "Post geloescht"
		redirect_to :back
	end
end
