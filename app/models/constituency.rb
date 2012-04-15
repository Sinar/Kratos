class Constituency < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  belongs_to :region, :primary_key => 'code', :foreign_key => 'region_code'
  belongs_to :member, :primary_key => 'uuid', :foreign_key => 'member_uuid'
  belongs_to :previous, :class_name => "Constituency", :primary_key => 'uuid', :foreign_key => 'previous_uuid'

  validates :uuid, :uniqueness => true
  validates :region_code, :presence => true
  validates :region, :associated => true
  # A constituency may not have a member when the constituency data is ready but election has not yet arrived.
  # With :valid_until, it means that we are tracking by-election occurrences. A member can have multiple constituency
  # entries within the same iteration at different time.
  validates :member_uuid, :uniqueness => { :scope => [:code, :iteration, :valid_until]  }, :allow_nil => true
  validates :member, :associated => true
  # A constituency can only be referenced (via previous) once.
  validates :previous_uuid, :uniqueness => true
  validates :previous, :associated => true, :allow_nil => true
  validates :name, :length => { :minimum => 1, :maximum => 255 }
  validates :iteration, :numericality => { :greater_than_or_equal_to => 0 }
  validates :code, :numericality => { :greater_than_or_equal_to => 0 }, :uniqueness => { :scope => [ :iteration, :valid_until ] }

  def to_param
    uuid
  end

end
