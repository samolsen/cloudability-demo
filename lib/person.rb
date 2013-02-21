module Person 

  def self.included(klass)    
    klass.class_eval do
      attr_accessible :birth_date, :gender, :name
  
      validates :name,    :presence => true, :uniqueness => true
      validates :gender,  :inclusion => { :in => Gender::ALL, :message => :must_be_selected }, :allow_nil => false
    end
  end
  
end