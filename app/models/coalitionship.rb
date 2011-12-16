class Coalitionship < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  belongs_to :party, :primary_key => 'code'
  belongs_to :coalition, :primary_key => 'code'

  validates_numericality_of :joined_at, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => false
  validates_numericality_of :parted_at, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => true

  def to_param
    uuid
  end

end
