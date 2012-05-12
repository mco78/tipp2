class Round < ActiveRecord::Base

	has_many :games
	belongs_to :cup
	has_many :bets, :through => :games

	validates :name,	:presence => true
	validates_uniqueness_of		:name, :scope => :cup_id
	validates :leg,		:presence => true
	validates :cup_id,	:presence => true
end
