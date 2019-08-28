class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :centers, through: :reviews

  validates :username, presence: true
  validates :password, presence: true
end
