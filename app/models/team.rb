 # -*- coding: utf-8 -*-
class Team < ActiveRecord::Base

	#gelöscht, da es Probleme beim Löschen von Teams gab
	#has_and_belongs_to_many :games

	
	validates :name, 	:presence => true, :uniqueness => true
	validates :acronym,	:presence => true#ausgeschaltet bei automatischer teamerstellung, :uniqueness => true
	validates_length_of :acronym, :is => 3, :message => "Abkürzung muss genau 3 Zeichen haben!"

	before_validation :uppercase_acronym

	def uppercase_acronym
		self.acronym.upcase!
	end

end
