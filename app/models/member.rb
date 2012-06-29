require 'uuid_helper'

class Member < ActiveRecord::Base

  include UUIDHelper
  nilify_blanks
  set_primary_key :uuid

  has_many :party_memberships, :primary_key => 'uuid', :foreign_key => 'member_uuid'

  validates :uuid, :uniqueness => true
  validates :name, :length => { :minimum => 1, :maximum => 255 }
  validates :email, :email => true, :allow_blank => true
  validates :facebook, :url => true, :allow_blank => true
  validates :twitter, :url => true, :allow_blank => true
  validates :www, :url => true, :allow_blank => true
  validates :phone, :format => { :with => /^0[0-9]+/ }, :allow_blank => true
  validates :fax, :format => { :with => /^0[0-9]+/ }, :allow_blank => true

  def to_param
    uuid
  end

  def party
    if pm = party_memberships.where(member_uuid: uuid, parted_at: nil).first
      pm.party
    end
  end

end
