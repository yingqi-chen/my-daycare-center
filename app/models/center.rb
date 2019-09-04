class Center < ActiveRecord::Base


  def average
    value_array=[]
    self.rates.each do |r|
    value_array<<r.rate_value
    end
    value_array.inject(0.0)  { |sum, el| sum + el } / value_array.size
  end

  has_many :reviews
  has_many :rates, :inverse_of => :center, through: :reviews
  has_many :users, through: :reviews


  validates :name, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
end
