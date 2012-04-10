class RemoveHometeamFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :hometeam
        remove_column :games, :awayteam
      end

  def down
    add_column :games, :awayteam, :string
    add_column :games, :hometeam, :string
  end
end
