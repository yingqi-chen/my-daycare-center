class Center < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
end
