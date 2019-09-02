class Center < ActiveRecord::Base
  #attr_accessor :rates, :name, :address, :phone_number

  #def initialize(attributes)
      #ttributes.each {|key, value| self.send(("#{key}="), value)}
      #@rates={}
  #  end

  #def average_rate #to get an average of rates array
    #rate_array=[]
    #self.rates.each_value{|v| rate_array<<v}
    #rate_array.sum/rate_array.size
  #end

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :address, uniqueness: true
end
