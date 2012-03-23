class Post < ActiveRecord::Base

	validates :headline, 	:presence => true
	validates :category, 	:presence => true
	validates :content, 	:presence => true

	default_scope :order => 'created_at DESC'
	scope :news, where(:category => 'News')
end
