class AddCupToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :cup_id, :integer

  end
end
