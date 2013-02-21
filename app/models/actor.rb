class Actor < ActiveRecord::Base
  
  attr_accessible :birth_date, :gender, :name
  
  validates :name,    :presence => true, :uniqueness => true
  validates :gender,  :presence => true, :inclusion => { :in => Gender::ALL }
  
  has_many :dvd_roles
  has_many :dvds, :through => :dvd_roles
end
