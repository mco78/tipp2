class RemoveCupFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :cup
      end

  def down
    add_column :games, :cup, :string
  end
end
