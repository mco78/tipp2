class AddHomeAwayTeamToGame < ActiveRecord::Migration
  def change
    add_column :games, :home_team, :integer

    add_column :games, :away_team, :integer

    rename_column :games, :homescore, :home_score
    rename_column :games, :awayscore, :away_score

  end
end
