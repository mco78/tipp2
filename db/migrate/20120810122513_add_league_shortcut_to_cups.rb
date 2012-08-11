class AddLeagueShortcutToCups < ActiveRecord::Migration
  def change
  	add_column :cups, :league_shortcut, :string
  	add_column :cups, :league_season, :integer
  end
end
