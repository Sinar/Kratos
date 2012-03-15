require 'uuid_helper'

class Member < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  validates_uniqueness_of :uuid
  has_many :party_memberships, :primary_key => 'uuid', :foreign_key => 'member_uuid'

  def to_param
    uuid
  end

  def party
    if pm = party_memberships.where(member_uuid: uuid, parted_at: nil).first
      pm.party
    end
  end

end
