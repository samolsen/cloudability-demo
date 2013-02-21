require 'spec_helper'

describe Director do
  before :each do
    @director = FactoryGirl.build(:director)
  end
  
  # * At a minimum, Actor must contain fields for name, date of birth, and gender.
  
  it 'should have a name attribute' do
    @director.should respond_to(:name)
    @director.should respond_to(:name=)
  end
  
  it 'should have a birth date attribute' do
    @director.should respond_to(:birth_date)
    @director.should respond_to(:birth_date=)
  end
  
  it 'should have a gender attribute' do
    @director.should respond_to(:gender)
    @director.should respond_to(:gender=)
  end
  
  # Only name and gender shall be mandatory
  
  it 'should require a name' do
    @director.name = nil
    @director.errors_on(:name).should_not be_empty
  end
  
  it 'should require a gender' do
    @director.gender = nil
    @director.errors_on(:gender).should_not be_empty
  end
  
  # Name shall enforce uniqueness.
  
  it 'should have a unique name' do
    @director.save!
    another_director = FactoryGirl.build(:director, :name => @director.name) 
    another_director.errors_on(:name).should_not be_empty
  end
  
  it 'should accept male for gender' do
    @director.gender = 'male'
    @director.errors_on(:gender).should be_empty
  end
  
  it 'should accept female for gender' do
    @director.gender = 'female'
    @director.errors_on(:gender).should be_empty
  end
  
  it 'should not accept an invalid gender' do
    @director.gender = 'unknown'
    @director.errors_on(:gender).should_not be_empty
  end
  
  it 'should direct DVDs' do
    number_of_dvds = rand(1..20)
    FactoryGirl.create(:director_with_dvds, :number_of_dvds => number_of_dvds).dvds.length.should be number_of_dvds
  end
  
  
end
