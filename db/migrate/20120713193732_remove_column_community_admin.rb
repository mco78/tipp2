class RemoveColumnCommunityAdmin < ActiveRecord::Migration
  def change
    remove_column :communities, :community_admin, :integer

  end
end
