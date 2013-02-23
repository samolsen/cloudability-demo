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
  
  it 'renders the search form' do
    render
    assert_select "form", :action => dvds_path, :method => "get" do
      assert_select "input#search_name", :name => "search[name]"
      assert_select "select#search_director_id", :name => "search[director_id]"
      assert_select "select#search_actor_id", :name => "search[actor_id]"
    end
  end
end
