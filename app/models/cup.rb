class Cup < ActiveRecord::Base

	has_many :rounds
	has_many :games, :through => :bets
	has_many :teams

	validates :name,	:presence => true, :uniqueness => true
	
end
