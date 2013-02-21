require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the DvdsHelper. For example:
#
# describe DvdsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe DvdsHelper do
  
  describe 'Amazon URL' do
    it 'builds an Amazon product URL given a DVD' do      
      dvd = FactoryGirl.build(:dvd, :asin => 'ASIN-VALUE-HERE')
    
      helper.amazon_url_for(dvd).should eq('http://www.amazon.com/dp/ASIN-VALUE-HERE')
    end
  end
  
end
