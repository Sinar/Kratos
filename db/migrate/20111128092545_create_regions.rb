class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions, { :id => false } do |t|
      t.string :code, :null => false
      t.string :name, :null => false
    end
    add_index :regions, :code, :unique => true
  end
end
