class User < ActiveRecord::Base
  has_secure_password
  has_many :league
  has_many :teams
end