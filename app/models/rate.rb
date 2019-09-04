class Rate < ActiveRecord::Base
  belongs_to :review, :inverse_of => :rate
  belongs_to :center, :inverse_of => :rate

end
