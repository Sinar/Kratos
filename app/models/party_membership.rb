class PartyMembership < ActiveRecord::Base

  include UUIDHelper

  # belongs_to :party
  # belongs_to :member

  # validates_length_of :joined_at, :in => 1900..2100, :allow_nil => false
  # validates_length_of :parted_at, :in => 1900..2100, :allow_nil => true

end
