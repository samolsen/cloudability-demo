require 'spec_helper'

describe Dvd do
  
  before :each do
    @dvd = FactoryGirl.build(:dvd)
  end
  
  # At a minimum, a DVD must contain fields for the name, release date, summary, and ASIN (Amazon product ID).
  
  it 'should have a name attribute' do
    @dvd.should respond_to(:name)
    @dvd.should respond_to(:name=)
  end
  
  it 'should have a release date attribute' do
    @dvd.should respond_to(:release_date)
    @dvd.should respond_to(:release_date=)
  end
  
  it 'should have a summary attribute' do
    @dvd.should respond_to(:summary)
    @dvd.should respond_to(:summary=)
  end
  
  it 'should have an ASIN attribute' do
    @dvd.should respond_to(:asin)
    @dvd.should respond_to(:asin=)
  end
  
  # Only name and summary shall be mandatory  
  
  it 'should require a name' do
    @dvd.name = nil
    @dvd.errors_on(:name).should_not be_empty
  end
  
  it 'should require a summary' do
    @dvd.summary = nil
    @dvd.errors_on(:summary).should_not be_empty
  end
  
  # Name shall enforce uniqueness.
  
  it 'should have a unique name' do
    @dvd.save!
    other_dvd = FactoryGirl.build(:dvd, :name => @dvd.name)
    other_dvd.errors_on(:name).should_not be_empty
  end
  
  it 'can have a director' do
    FactoryGirl.create(:dvd_with_director).director.should be_a(Director)
  end
  
  it 'should allow mass assignment of director id' do
    director = FactoryGirl.create(:director)
    @dvd.update_attributes :director_id => director.id
    @dvd.director.should eq(director)
  end
  
end

describe Dvd, 'cast' do
    
  it 'should have actors' do
    cast_size = rand(1..20)
    FactoryGirl.create(:dvd_with_cast, :cast_size => cast_size).actors.length.should be cast_size
  end
  
  it 'should remove actor associations on delete' do
    cast_size = 10
    dvd = FactoryGirl.create(:dvd_with_cast, :cast_size => cast_size)
    
    dvd_role_count = DvdRole.count
    dvd.destroy
    
    DvdRole.count.should eq(dvd_role_count - cast_size)
  end
  
  it 'should allow mass assignment of actor ids' do
    actors = 3.times.map { FactoryGirl.create(:actor) }
    params = FactoryGirl.attributes_for(:dvd)
    params[:actor_ids]= actors.map { |actor| actor.id }
    
    dvd = Dvd.new(params)
    dvd.actors.should eq(actors)
  end
    
end


describe Dvd, 'search' do
  # I should be able to search for DVDs by name, director, or actor/actress.
  
  it 'should find DVDs by name' do
    dvd = FactoryGirl.create(:dvd)
    Dvd.search(:name => dvd.name).should include(dvd)
  end
  
  it 'should find DVDs by director' do
    dvd = FactoryGirl.create(:dvd, :director => FactoryGirl.create(:director))
    Dvd.search(:director_id => dvd.director_id).should include(dvd)
  end
  
  it 'should find DVDs by actor' do
    dvd = FactoryGirl.create(:dvd, :actors => [FactoryGirl.create(:actor)])
    Dvd.search(:actor_id => dvd.actors.first.id).should include(dvd)
  end
  
end