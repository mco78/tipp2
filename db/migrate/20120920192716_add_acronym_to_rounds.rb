class AddAcronymToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :acronym, :string
  end
end
