 # -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Cup.delete_all

Game.delete_all

Round.delete_all

Team.delete_all

User.delete_all

Bet.delete_all

Community.delete_all

Post.delete_all


#Users


user1 = User.create( 	:username => "test",
						:email => "test@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user1.confirm!

com1 = Community.create(
						:name => "testcom",
						:password => "testtest",
						:admin_id => user1.id
						)

user1.community_id = com1.id
user1.save

user2 = User.create( 	:username => "test2",
						:email => "test2@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user2.confirm!
user2.community_id = com1.id
user2.save

user3 = User.create( 	:username => "test3",
						:email => "test3@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user3.confirm!
user3.community_id = com1.id
user3.save

user4 = User.create( 	:username => "test4",
						:email => "test4@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user4.confirm!


com2 = Community.create(
						:name => "testcom2",
						:password => "testtest",
						:admin_id => user4.id
						)

user4.community_id = com2.id
user4.save

user5 = User.create( 	:username => "test5",
						:email => "test5@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user5.confirm!
user5.community_id = com2.id
user5.save

user6 = User.create( 	:username => "test6",
						:email => "test6@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user6.confirm!
user6.community_id = com2.id
user6.save

user7 = User.create( 	:username => "test7",
						:email => "test7@test.com",
						:password => "testtest",
						:password_confirmation => "testtest"
						)
user7.confirm!
user7.community_id = com2.id
user7.save

