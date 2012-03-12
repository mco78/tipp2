class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
		@title = "Homepage"
	end

	def admin
		@title = "Admin Übersicht"
	end

	def about
		@title = "Über das Projekt"
	end

	def impressum
		@title = "Impressum"
	end

end
