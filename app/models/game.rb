class Game < ActiveRecord::Base

	has_many :bets
	has_many :users, :through => :bets

	validates :cup,			:presence => true
	validates :kickoff, 	:presence => true
	validates :hometeam,	:presence => true
	validates :awayteam,	:presence => true

end
