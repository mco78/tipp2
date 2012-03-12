class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :cup
      t.string :round
      t.datetime :kickoff
      t.string :hometeam
      t.string :awayteam
      t.integer :homescore
      t.integer :awayscore

      t.timestamps
    end
  end
end
