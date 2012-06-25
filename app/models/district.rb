class District < ActiveRecord::Base

  include UUIDHelper
  nilify_blanks
  set_primary_key :uuid

  belongs_to :constituency, :primary_key => 'uuid', :foreign_key => 'constituency_uuid'
  belongs_to :member, :primary_key => 'uuid', :foreign_key => 'member_uuid'
  belongs_to :previous, :class_name => "District", :primary_key => 'uuid', :foreign_key => 'previous_uuid'

  validates_uniqueness_of :uuid

  def to_param
    uuid
  end

end
