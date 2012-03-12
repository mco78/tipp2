class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
		@title = "Homepage"
	end

	def admin
		@title = "Admin Übersicht"
	end

end
