 # -*- coding: utf-8 -*-
class Game < ActiveRecord::Base

	has_many :bets
	has_many :users, :through => :bets

	validates :cup,			:presence => true
	validates :kickoff, 	:presence => true
	validates :hometeam,	:presence => true
	validates :awayteam,	:presence => true
	validates_numericality_of :homescore, :only_integer => true, :allow_nil => true
	validates_numericality_of :awayscore, :only_integer => true, :allow_nil => true

end
