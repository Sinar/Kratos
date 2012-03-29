class AddRoleAndAuthTokenToUsers < ActiveRecord::Migration

  def change
    add_column :users, :role, :string, :limit => 16, :null => false, :default => 'basic', :after => :uuid
    add_column :users, :authentication_token, :string, :after => :encrypted_password
  end

end
