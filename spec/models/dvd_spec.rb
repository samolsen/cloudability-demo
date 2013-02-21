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
  
end

describe Dvd, 'cast' do
    
  it 'should have actors' do
    cast_size = rand(1..20)
    FactoryGirl.create(:dvd_with_cast, :cast_size => cast_size).actors.length.should be cast_size
  end
    
end
