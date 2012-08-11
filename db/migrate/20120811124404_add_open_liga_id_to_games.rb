class AddOpenLigaIdToGames < ActiveRecord::Migration
  def change
  	add_column :games, :open_liga_id, :integer
  end
end
