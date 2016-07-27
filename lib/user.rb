require 'rubygems'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

DataMapper.setup(:default, 'postgres://Guest:guest@localhost/lead_level_test')


class User < ActiveRecord::Base

  include DataMapper::Resource
  include BCrypt

  property :id, Serial, :key => true
  property :user_name, String, :unique => true, :length => 3..50
  property :password, BCryptHash, :length => 1..100
  property :first_name, String
  property :last_name, String
  property :contact_id, Integer


  has_many(:results)
  has_and_belongs_to_many(:places)
  belongs_to(:contact)
end

DataMapper.finalize
DataMapper.auto_upgrade!
