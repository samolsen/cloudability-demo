module Person 

  def self.included(klass)    
    klass.class_eval do
      attr_accessible :birth_date, :gender, :name
  
      validates :name,    :presence => true, :uniqueness => true
      validates :gender,  :presence => true, :inclusion => { :in => Gender::ALL }
    end
  end
  
end