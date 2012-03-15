class AddUuidToPartiesAndCoalitionships < ActiveRecord::Migration

  def up

    add_column :parties, :uuid, :string, :limit => 36, :null => false, :first => true, :default => ''
    add_column :party_memberships, :party_uuid, :string, :after => :party_code
    add_column :coalitionships, :party_uuid, :string, :null => false, :after => :coalition_code, :default => ''

    add_column :coalitions, :uuid, :string, :limit => 36, :null => false, :first => true, :default => ''
    add_column :coalitionships, :coalition_uuid, :string, :after => :coalition_code

    Party.reset_column_information
    PartyMembership.reset_column_information
    Coalitionship.reset_column_information
    Coalition.reset_column_information

    say_with_time "Regenerating UUID for parties..." do

      Party.all.each do |p|

        # Because we are changing primary/unique key, this is how stupid it can go with update_attribute:
        # UPDATE "parties" SET "uuid" = 'c2de20ba-6e69-11e1-b4da-080027f072f5' WHERE "parties"."uuid" = 'c2de20ba-6e69-11e1-b4da-080027f072f5'
        uuid = UUIDTools::UUID.timestamp_create.to_s
        execute <<-SQL
          UPDATE parties SET uuid='#{uuid}' WHERE code='#{p.code}'
        SQL

        PartyMembership.where(:party_code => p.code).each do |pm|
          pm.update_attribute :party_uuid, uuid
        end

        Coalitionship.where(:party_code => p.code).each do |cs|
          cs.update_attribute :party_uuid, uuid
        end

      end
    end

    PartyMembership.all.each do |pm|
      puts pm.inspect
    end

    say_with_time "Regenerating UUID for coalitions..." do

      Coalition.all.each do |c|

        uuid = UUIDTools::UUID.timestamp_create.to_s
        execute <<-SQL
          UPDATE coalitions SET uuid='#{uuid}' WHERE code='#{c.code}'
        SQL

        Coalitionship.where(:coalition_code => c.code).each do |cs|
          cs.update_attribute :coalition_uuid, uuid
        end

      end
    end

    # Perform index changes first, otherwise, some change_column statements could get insertion of data into altered table failed.
    add_index :parties, :uuid, :unique => true
    remove_index :party_memberships, :name => 'index_party_memberships_on_when_member_joins_party'
    add_index :party_memberships, [:party_uuid, :member_uuid, :joined_at], :unique => true, :name => 'index_party_memberships_on_when_member_joins_party'

    add_index :coalitions, :uuid, :unique => true
    add_index :coalitionships, [:coalition_uuid, :party_uuid, :joined_at], :unique => true, :name => 'index_coalitionships_on_when_member_joins_party'

    remove_column :coalitionships, :coalition_code
    change_column :coalitions, :uuid, :string, :limit => 36, :null => false, :first => true

    remove_column :coalitionships, :party_code
    change_column :coalitionships, :party_uuid, :string, :null => false, :after => :coalition_code
    remove_column :party_memberships, :party_code
    change_column :parties, :uuid, :string, :limit => 36, :null => false, :first => true

  end

  def down

    add_column :party_memberships, :party_code, :string, :after => :party_uuid
    add_column :coalitionships, :party_code, :string, :null => false, :after => :party_uuid, :default => ''

    add_column :coalitionships, :coalition_code, :string, :after => :coalition_uuid

    Party.reset_column_information
    PartyMembership.reset_column_information
    Coalitionship.reset_column_information
    Coalition.reset_column_information

    say_with_time "Restoring code for coalitions..." do

      Coalition.all.each do |c|

        Coalitionship.where(:coalition_uuid => c.uuid).each do |cs|
          cs.update_attribute :coalition_code, c.code
        end

      end
    end

    say_with_time "Restoring code for parties..." do

      Party.all.each do |p|

        PartyMembership.where(:party_uuid => p.uuid).each do |pm|
          pm.update_attribute :party_code, p.code
        end

        Coalitionship.where(:party_uuid => p.uuid).each do |cs|
          cs.update_attribute :party_code, p.code
        end

      end
    end

    remove_index :coalitionships, :name => 'index_coalitionships_on_when_member_joins_party'
    add_index :coalitionships, :coalition_code
    add_index :coalitionships, :party_code
    remove_index :coalitions, :uuid

    remove_index :party_memberships, :name => 'index_party_memberships_on_when_member_joins_party'
    add_index :party_memberships, [:party_code, :member_uuid, :joined_at], :unique => true, :name => 'index_party_memberships_on_when_member_joins_party'
    remove_index :parties, :uuid

    remove_column :coalitionships, :coalition_uuid
    remove_column :coalitions, :uuid

    remove_column :coalitionships, :party_uuid
    remove_column :party_memberships, :party_uuid
    remove_column :parties, :uuid
    change_column :coalitionships, :party_code, :string, :null => false, :after => :party_uuid

  end

end
