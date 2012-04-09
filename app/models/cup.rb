class Cup < ActiveRecord::Base

	has_many :rounds
	has_many :games, :through => :bets

	validates :name,	:presence => true, :uniqueness => true
	
end
