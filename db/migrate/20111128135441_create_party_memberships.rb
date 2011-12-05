class CreatePartyMemberships < ActiveRecord::Migration
  def change
    create_table :party_memberships, { :id => false } do |t|
      t.string :uuid, :limit => 36, :null => false
      t.string :party_code
      t.string :member_uuid, :null => false
      t.integer :joined_at, :null => false
      t.integer :parted_at
      t.timestamps
    end
    add_index :party_memberships, :uuid, :unique => true
    add_index :party_memberships, [:party_code, :member_uuid, :joined_at], :unique => true, :name => 'index_party_memberships_on_when_member_joins_party'
  end
end
