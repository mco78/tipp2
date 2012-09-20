 # -*- coding: utf-8 -*-
class Round < ActiveRecord::Base

	has_many :games
	belongs_to :cup
	has_many :bets, :through => :games

	validates :name,	:presence => true
	validates_uniqueness_of		:name, :scope => :cup_id
	validates :leg,		:presence => true
	validates :cup_id,	:presence => true
	validates_length_of :acronym, :maximum => 6, :message => "Abkürzung darf maximal 6 Zeichen haben!"
end
