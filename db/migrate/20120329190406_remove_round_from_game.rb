class RemoveRoundFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :round
      end

  def down
    add_column :games, :round, :string
  end
end
