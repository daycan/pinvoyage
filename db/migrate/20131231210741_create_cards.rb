class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :place
      t.string "text"
      t.timestamps
    end
  end
end
