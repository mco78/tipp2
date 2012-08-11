class AddOpenLigaTeamIdToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :open_liga_id, :integer
  end
end
