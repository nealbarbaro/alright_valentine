class RemoveReceiverFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :receiver
  end

  def down
    add_column :messages, :receiver, :integer
  end
end
