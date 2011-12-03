class CreateCoalitionships < ActiveRecord::Migration
  def change
    create_table :coalitionships, { :id => false } do |t|
      t.string :uuid, :null => false
      t.string :coalition_code
      t.string :party_code, :null => false
      t.integer :joined_at, :null => false
      t.integer :parted_at
      t.timestamps
    end
    add_index :coalitionships, :uuid, :unique => true
    add_index :coalitionships, :coalition_code
    add_index :coalitionships, :party_code
  end
end
