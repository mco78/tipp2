class AddOpenLigaIdToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :open_liga_id, :integer
  end
end
