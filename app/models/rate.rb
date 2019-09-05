class Rate < ActiveRecord::Base
  belongs_to :review
  belongs_to :center
end
