class Coalitionship < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  belongs_to :party, :primary_key => 'uuid', :foreign_key => 'party_uuid'
  belongs_to :coalition, :primary_key => 'uuid', :foreign_key => 'coalition_uuid'

  validates :uuid, :uniqueness => true
  validates :party_uuid, :presence => true
  validates :party, :associated => true
  validates :coalition_uuid, :presence => true
  validates :coalition, :associated => true
  validates :joined_at, :numericality => { :greater_than_or_equal_to => 1900, :less_than => 2100 }
  validates :parted_at, :numericality => { :greater_than_or_equal_to => 1900, :less_than => 2100 }, :allow_nil => true

  def to_param
    uuid
  end

end
