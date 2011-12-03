require 'uuid_helper'

class Party < ActiveRecord::Base

  has_many :coalitionships, :primary_key => 'code', :foreign_key => 'party_code'

  validates_numericality_of :founded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => false
  validates_numericality_of :disbanded_in, :greater_than_or_equal_to => 1900, :less_than => 2100, :allow_nil => true

  def coalition
    coalitionships.where(parted_at: nil).first
  end

end
