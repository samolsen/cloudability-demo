require 'spec_helper'

describe "dvds/show" do
  before(:each) do
    @dvd = assign(:dvd, stub_model(Dvd,
      :name => "Name",
      :summary => "MyText",
      :asin => "Asin"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Asin/)
  end
  
  it 'renders Amazon link' do
    render
    
    rendered.should match(/http:\/\/www\.amazon\.com/)
  end
end
