class AddCommunityAdminToCommunites < ActiveRecord::Migration
  def change
    add_column :communities, :community_admin, :integer

  end
end
