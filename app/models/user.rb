class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, :on => :create
  validates_uniqueness_of :phone_number
  validates_uniqueness_of :username
end
