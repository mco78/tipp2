class Community < ActiveRecord::Base
	has_many :users

	validates :name, 		:presence 	=> true,
							:length		=> { :within => 6..30},
							:uniqueness => true

	validates :password, 	:presence 		=> true,
							:confirmation	=> true,
							:length			=> { :within => 6..20}

	validates :admin_id, 	:presence 		=> true
	validates_numericality_of 	:admin_id, :only_integer => true

end
