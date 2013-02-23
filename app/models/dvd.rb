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
        unless params[:name].blank?
          results = results.where(:name => params[:name])
        end
      
        unless params[:director_id].blank?
          results = results.where(:director_id => params[:director_id]) 
        end
      
        unless params[:actor_id].blank?
          results = results.joins(:dvd_roles).where(:dvd_roles => { :actor_id => params[:actor_id] })
        end
      end
      
      results
    end
    
  end
end
