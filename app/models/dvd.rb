class Dvd < ActiveRecord::Base
  attr_accessible :asin, :name, :release_date, :summary, :actor_ids, :director_id
  
  validates :name,    :presence => true, :uniqueness => true
  validates :summary, :presence => true
  
  has_many :dvd_roles, :dependent => :destroy
  has_many :actors, :through => :dvd_roles
  
  belongs_to :director
  
  class << self
    
    def search(params)
      results = self.scoped
      
      if params
        if params[:name]
          results = results.where(:name => params[:name])
        end
      
        if params[:director_id]
          results = results.where(:director_id => params[:director_id]) 
        end
      
        if params[:actor_id]
          results = results.joins(:dvd_roles).where(:dvd_roles => { :actor_id => params[:actor_id] })
        end
      end
      
      results
    end
    
  end
end
