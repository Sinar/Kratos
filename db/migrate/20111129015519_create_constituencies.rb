class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies, { :id => false } do |t|
      t.string :uuid, :limit => 36, :null => false
      t.string :region_code, :null => false
      t.string :member_uuid, :null => false
      t.string :name, :null => false
      t.integer :iteration, :null => false
      t.date :valid_until
      t.string :previous_uuid
      t.timestamps
    end
    add_index :constituencies, :uuid, :unique => true
    add_index :constituencies, :region_code
    add_index :constituencies, :member_uuid
    add_index :constituencies, :previous_uuid
  end
end
