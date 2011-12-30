class DeviseCreateAdmins < ActiveRecord::Migration

  def change
    create_table :admins, { :id => false } do |t|
      
      t.string :uuid, :limit => 36, :null => false

      t.database_authenticatable :null => false
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.rememberable
      t.trackable
      t.timestamps

    end

    add_index :admins, :uuid, :unique => true
    add_index :admins, :email,                :unique => true
    add_index :admins, :unlock_token,         :unique => true
    
  end

end
