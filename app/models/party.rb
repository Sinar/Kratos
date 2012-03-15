require 'uuid_helper'

class Party < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  has_many :coalitionships, :primary_key => 'uuid', :foreign_key => 'party_uuid'

  validates_uniqueness_of :uuid
  validates_numericality_of :founded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => false
  validates_numericality_of :disbanded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => true

  def to_param
    uuid
  end

  def coalition
    if (c = coalitionships.where(party_uuid: uuid, parted_at: nil).first)
      c.coalition
    end
  end

end
