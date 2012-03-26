require 'uuid_helper'

class User < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid
  
  devise :database_authenticatable, :lockable, :rememberable, :timeoutable, :trackable
  attr_accessible :email, :password, :remember_me

  validates_uniqueness_of :uuid
  
end
