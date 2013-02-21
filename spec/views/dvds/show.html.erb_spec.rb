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

  def amazon_regex
    /http:\/\/www\.amazon\.com/
  end
  
  it 'renders Amazon link' do
    render
    rendered.should match(amazon_regex)
  end
  
  it 'does not render Amazon link if no ASIN is nil' do
    @dvd.asin = nil
    render 
    rendered.should_not match(amazon_regex)
  end
  
  it 'does not render Amazon link if no ASIN is empty string' do
    @dvd.asin = ''
    render 
    rendered.should_not match(amazon_regex)
  end
end
