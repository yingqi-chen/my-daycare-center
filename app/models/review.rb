class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :center
  has_one :rate, dependent: :destroy, :inverse_of => :review

  validates :user_id, :center_id, presence: true
  validates_associated :user
end
