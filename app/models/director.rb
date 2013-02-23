class Director < ActiveRecord::Base
  include Person
  
  has_many :dvds
  
  attr_accessible :dvd_ids
end
