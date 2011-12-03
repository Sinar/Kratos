class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties, { :id => false } do |t|
      t.string :code, :null => false
      t.string :name, :null => false
      t.string :name_in_malay, :null => false
      t.integer :founded_in, :null => false
      t.integer :disbanded_in
    end
    add_index :parties, :code, :unique => true
  end
end
