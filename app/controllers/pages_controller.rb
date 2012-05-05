 # -*- coding: utf-8 -*-
class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
		@title = "Homepage"
		@posts = Post.limit(5)
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
