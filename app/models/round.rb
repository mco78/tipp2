class Round < ActiveRecord::Base

	has_many :games
	belongs_to :cup
	has_many :bets, :through => :games

	validates :name,	:presence => true, :uniqueness => true
	validates :leg,		:presence => true
	validates :cup_id,	:presence => true
end
