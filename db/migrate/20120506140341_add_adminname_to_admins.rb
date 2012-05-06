class AddAdminnameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :adminname, :string

  end
end
