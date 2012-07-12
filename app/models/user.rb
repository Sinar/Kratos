require 'uuid_helper'

class User < ActiveRecord::Base

  include UUIDHelper
  nilify_blanks
  set_primary_key :uuid

  attr_accessible :email, :password, :remember_me, :role
  devise :database_authenticatable, :lockable, :rememberable, :timeoutable, :token_authenticatable, :trackable
  enum_attr :role, %w(admin basic anonymous)

  validates :uuid, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates :password, :length => { :within => Devise.password_length }, :allow_blank => true

  def to_param
    uuid
  end

  # See: Devise::Models::DatabaseAuthenticatable
  # See: http://stackoverflow.com/a/5070882/36397
  def update_with_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params, *options)
    clean_up_passwords
  end
  
end
