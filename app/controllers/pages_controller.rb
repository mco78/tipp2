class PagesController < ApplicationController
  
	before_filter :authenticate_admin!, :only => [:admin]

	def home
	end

	def admin
	end

end
