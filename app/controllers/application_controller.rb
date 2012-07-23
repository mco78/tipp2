 # -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
	protect_from_forgery

	def authenticate_any!
		if admin_signed_in?
			true
		else
			authenticate_user!
		end
	end
end
