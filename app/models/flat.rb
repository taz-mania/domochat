class Flat < ActiveRecord::Base
  validates_presence_of :number, :floor, :entrance
end
