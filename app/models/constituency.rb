class Constituency < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  belongs_to :region, :primary_key => 'code', :foreign_key => 'region_code'
  belongs_to :member, :primary_key => 'uuid', :foreign_key => 'member_uuid'
  belongs_to :previous, :class_name => "Constituency", :primary_key => 'uuid', :foreign_key => 'previous_uuid'

  validates_uniqueness_of :uuid

  def to_param
    uuid
  end

end
