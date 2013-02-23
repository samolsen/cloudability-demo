class Actor < ActiveRecord::Base
  
  include Person
  
  has_many :dvd_roles, :dependent => :destroy
  has_many :dvds, :through => :dvd_roles
  
  attr_accessible :dvd_ids
end
