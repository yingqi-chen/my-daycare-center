class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :center

  validates :user_id, :center_id, presence: true
  validates :rate, presence: true
  validates_associated :user
end
