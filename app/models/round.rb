class Round < ActiveRecord::Base

	has_many :games
	belongs_to :cup

	validates :name,	:presence => true, :uniqueness => true
	validates :leg,		:presence => true
	validates :cup_id,	:presence => true
end
