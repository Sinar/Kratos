class Coalitionship < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  belongs_to :party, :primary_key => 'uuid', :foreign_key => 'party_uuid'
  belongs_to :coalition, :primary_key => 'uuid', :foreign_key => 'coalition_uuid'

  validates_uniqueness_of :uuid
  validates_numericality_of :joined_at, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => false
  validates_numericality_of :parted_at, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => true

  def to_param
    uuid
  end

end
