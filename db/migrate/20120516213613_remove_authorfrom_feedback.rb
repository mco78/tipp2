class RemoveAuthorfromFeedback < ActiveRecord::Migration
  def change
  	remove_column :feedbacks, :author, :integer
  	remove_column :feedbacks, :admin, :boolean
  	add_column :feedbacks, :user_id, :integer
  	add_column :feedbacks, :admin_id, :integer
  end

end
