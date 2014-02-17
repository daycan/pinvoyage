class AddUsernameToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username, :null => false, :default => "Anonymous"
    end
    add_index :users, :username
  end

end
