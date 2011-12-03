require 'uuid_helper'

class Coalition < ActiveRecord::Base

  has_many :coalitionships, :primary_key => 'code', :foreign_key => 'coalition_code'
  has_many :parties, :through => :coalitionships

  validates_numericality_of :founded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => false
  validates_numericality_of :disbanded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => true

end
