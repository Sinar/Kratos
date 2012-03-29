class RenameAdminToUser < ActiveRecord::Migration
  def up
    rename_table :admins, :users
    remove_index :users, :name => 'index_admins_on_email'
    remove_index :users, :name => 'index_admins_on_unlock_token'
    remove_index :users, :name => 'index_admins_on_uuid'
    add_index :users, :uuid, :unique => true
    add_index :users, :email,                :unique => true
    add_index :users, :unlock_token,         :unique => true
  end
  def down
    rename_table :users, :admins
    remove_index :admins, :name => 'index_users_on_email'
    remove_index :admins, :name => 'index_users_on_unlock_token'
    remove_index :admins, :name => 'index_users_on_uuid'
    add_index :admins, :uuid, :unique => true
    add_index :admins, :email,                :unique => true
    add_index :admins, :unlock_token,         :unique => true
  end
end
