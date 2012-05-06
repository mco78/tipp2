class FixAdminnameColumn < ActiveRecord::Migration
  def up
  	rename_column :admins, :adminname, :username
  end

  def down
  end
end
