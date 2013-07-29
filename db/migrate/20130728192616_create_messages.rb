class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :receiver
      t.integer :sender

      t.timestamps
    end
  end
end
