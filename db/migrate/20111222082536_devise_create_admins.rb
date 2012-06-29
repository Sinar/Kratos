# See: https://github.com/plataformatec/devise/wiki/How-To:-Upgrade-to-Devise-2.0-migration-schema-style
class DeviseCreateAdmins < ActiveRecord::Migration

  def change
    create_table :admins, { :id => false } do |t|
      
      t.string :uuid, :limit => 36, :null => false

      # Was: t.database_authenticatable :null => false
      t.string :email, :null => false, :default => ''
      t.string :encrypted_password, :null => false, :default => ''

      # Was: t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.integer :failed_attempts, :default => 0
      t.string :unlock_token
      t.datetime :locked_at

      # Was: t.rememberable
      t.datetime :remember_created_at

      # Was: t.trackable
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.timestamps

    end

    add_index :admins, :uuid, :unique => true
    add_index :admins, :email, :unique => true
    add_index :admins, :unlock_token, :unique => true
    
  end

end
