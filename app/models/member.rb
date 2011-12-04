require 'uuid_helper'

class Member < ActiveRecord::Base

  has_many :party_memberships, :primary_key => 'uuid', :foreign_key => 'member_uuid'

  include UUIDHelper

  def party
    party_memberships.where(member_uuid: uuid, parted_at: nil).first
  end

end
