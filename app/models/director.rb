class Director < ActiveRecord::Base
  include Person
  
  has_many :dvds
end
