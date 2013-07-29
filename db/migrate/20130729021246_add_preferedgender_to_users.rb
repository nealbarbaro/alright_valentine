class AddPreferedgenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferedgender, :string
  end
end
