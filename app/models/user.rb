require 'uuid_helper'

class User < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid

  attr_accessible :email, :password, :remember_me
  devise :database_authenticatable, :lockable, :rememberable, :timeoutable, :token_authenticatable, :trackable
  enum_attr :role, %w(admin basic anonymous)

  validates_uniqueness_of :uuid
  validates_uniqueness_of :email

  def to_param
    uuid
  end
  
end
