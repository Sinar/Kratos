class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, { :id => false } do |t|
      t.string :uuid, :limit => 36, :null => false
      t.string :name, :null => false
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :www
      t.string :phone
      t.date :birthday
      t.text :biography
      t.date :birthday
      t.date :deceased_at
      t.timestamps
    end
    add_index :members, :uuid, :unique => true
  end
end
