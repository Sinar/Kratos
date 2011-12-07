class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts, { :id => false } do |t|
      t.string :uuid, :limit => 36, :null => false
      t.string :constituency_uuid, :null => false
      t.string :member_uuid, :null => false
      t.string :name, :null => false
      t.integer :iteration, :null => false
      t.date :valid_until
      t.string :previous_uuid
      t.timestamps
    end
    add_index :districts, :uuid, :unique => true
    add_index :districts, :constituency_uuid
    add_index :districts, :member_uuid
    add_index :districts, :previous_uuid
  end
end
