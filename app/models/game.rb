class Game < ActiveRecord::Base

	validates :cup,			:presence => true
	validates :kickoff, 	:presence => true
	validates :hometeam,	:presence => true
	validates :awayteam,	:presence => true

end
