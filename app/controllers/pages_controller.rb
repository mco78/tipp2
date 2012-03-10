class PagesController < ApplicationController
  
	before_filter :authenticate_user!, 	:only => [:userpage]
	before_filter :authenticate_admin!, :only => [:adminpage]

	def home
	end

	def userpage
	end

	def adminpage
	end

end
