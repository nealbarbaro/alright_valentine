class RemoveSenderFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :sender
  end

  def down
    add_column :messages, :sender, :integer
  end
end
