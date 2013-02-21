require 'spec_helper'

describe "dvds/index" do
  before(:each) do
    assign(:dvds, [
      stub_model(Dvd,
        :name => "Name",
        :summary => "MyText",
        :asin => "Asin"
      ),
      stub_model(Dvd,
        :name => "Name",
        :summary => "MyText",
        :asin => "Asin"
      )
    ])
  end

  it "renders a list of dvds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Asin".to_s, :count => 2
  end
end
