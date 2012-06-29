require 'uuid_helper'

class Region < ActiveRecord::Base

  nilify_blanks

  # Region (province or state) code in ISO-3166-2 format, two-digit numbers
  # See: http://en.wikipedia.org/wiki/ISO_3166-2:MY
  validates :code, :uniqueness => true, :format => { :with => /^[0-9]{2}$/ }
  validates :name, :length => { :minimum => 1, :maximum => 255 }

end
