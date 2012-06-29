require 'uuid_helper'

class User < ActiveRecord::Base

  include UUIDHelper
  nilify_blanks
  set_primary_key :uuid

  attr_accessible :email, :password, :remember_me
  devise :database_authenticatable, :lockable, :rememberable, :timeoutable, :token_authenticatable, :trackable
  enum_attr :role, %w(admin basic anonymous)

  validates :uuid, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates_length_of :password, :presence => true, :in => 4..64, :allow_blank => false

  def to_param
    uuid
  end
  
end
