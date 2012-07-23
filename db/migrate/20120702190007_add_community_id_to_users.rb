class AddCommunityIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :community_id, :integer
  end
end
