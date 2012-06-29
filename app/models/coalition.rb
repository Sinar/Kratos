require 'uuid_helper'

class Coalition < ActiveRecord::Base

  include UUIDHelper
  nilify_blanks
  set_primary_key :uuid

  has_many :coalitionships, :primary_key => 'uuid', :foreign_key => 'coalition_uuid'
  has_many :parties, :through => :coalitionships

  validates :uuid, :uniqueness => true
  validates :code, :length => { :minimum => 1, :maximum => 16 }, :uniqueness => { :scope => :disbanded_in }
  validates :name, :length => { :minimum => 1, :maximum => 255 }
  validates :name_in_malay, :length => { :minimum => 1, :maximum => 255 }
  validates :founded_in, :numericality => { :greater_than_or_equal_to => 1900, :less_than => 2100 }
  validates :disbanded_in, :numericality => { :greater_than_or_equal_to => 1900, :less_than => 2100 }, :allow_nil => true

  def to_param
    uuid
  end

end
