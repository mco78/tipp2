class AddPointsColumnToBets < ActiveRecord::Migration
  def change
    add_column :bets, :points, :integer

  end
end
