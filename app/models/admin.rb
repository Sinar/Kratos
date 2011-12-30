require 'uuid_helper'

class Admin < ActiveRecord::Base

  include UUIDHelper
  set_primary_key :uuid
  
  devise :database_authenticatable, :lockable, :rememberable, :timeoutable, :trackable
  attr_accessible :email, :password, :remember_me
  
end
