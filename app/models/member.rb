require 'uuid_helper'

class Member < ActiveRecord::Base
  include UUIDHelper
  # has_one :party, :through => :party_memberships, :conditions => ["party_memberships.parted_at IS NULL"]
  # has_one :constituency
end
