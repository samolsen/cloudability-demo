require 'spec_helper'

describe Actor do
  
  before :each do
    @actor = FactoryGirl.build(:actor)
  end
  
  # * At a minimum, Actor must contain fields for name, date of birth, and gender.
  
  it 'should have a name attribute' do
    @actor.should respond_to(:name)
    @actor.should respond_to(:name=)
  end
  
  it 'should have a birth date attribute' do
    @actor.should respond_to(:birth_date)
    @actor.should respond_to(:birth_date=)
  end
  
  it 'should have a gender attribute' do
    @actor.should respond_to(:gender)
    @actor.should respond_to(:gender=)
  end
  
  # Only name and gender shall be mandatory
  
  it 'should require a name' do
    @actor.name = nil
    @actor.errors_on(:name).should_not be_empty
  end
  
  it 'should require a gender' do
    @actor.gender = nil
    @actor.errors_on(:gender).should_not be_empty
  end
  
  # Name shall enforce uniqueness.
  
  it 'should have a unique name' do
    @actor.save!
    another_actor = FactoryGirl.build(:actor, :name => @actor.name) 
    another_actor.errors_on(:name).should_not be_empty
  end
  
  it 'should accept male for gender' do
    @actor.gender = 'male'
    @actor.errors_on(:gender).should be_empty
  end
  
  it 'should accept female for gender' do
    @actor.gender = 'female'
    @actor.errors_on(:gender).should be_empty
  end
  
  it 'should not accept an invalid gender' do
    @actor.gender = 'unknown'
    @actor.errors_on(:gender).should_not be_empty
  end
  
  it 'should appear in DVDs' do
    number_of_roles = rand(1..20)
    FactoryGirl.create(:actor_with_roles, :number_of_roles => number_of_roles).dvds.length.should be number_of_roles
  end
  
  it 'should remove DVD associations on delete' do
    role_count = 2
    actor = FactoryGirl.create(:actor_with_roles, :number_of_roles => role_count)
    dvd_role_count = DvdRole.count
    actor.destroy
    
    DvdRole.count.should eq(dvd_role_count - role_count)
  end
  
end
