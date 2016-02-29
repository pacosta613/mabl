class Teams < ActiveRecord::Base
  belongs_to :leagues
  has_many :players
end