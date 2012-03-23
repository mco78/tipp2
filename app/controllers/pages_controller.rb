class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
		@title = "Homepage"
		@posts = Post.limit(5)
	end

	def admin
		@title = "Admin Uebersicht"
	end

	def about
		@title = "Ueber das Projekt"
	end

	def impressum
		@title = "Impressum"
	end

end
