require 'spec_helper'

describe "dvds/edit" do
  before(:each) do
    @dvd = assign(:dvd, stub_model(Dvd,
      :name => "MyString",
      :summary => "MyText",
      :asin => "MyString"
    ))
  end

  it "renders the edit dvd form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dvds_path(@dvd), :method => "post" do
      assert_select "input#dvd_name", :name => "dvd[name]"
      assert_select "textarea#dvd_summary", :name => "dvd[summary]"
      assert_select "input#dvd_asin", :name => "dvd[asin]"
      
      assert_select "select#dvd_actor_ids", :name => "dvds[actor_ids]", :'data-placeholder' => t('data_placeholders.choose_the_cast')
      assert_select "select#dvd_director_id", :name => "dvds[director_id]", :'data-placeholder' => t('data_placeholders.choose_the_director')
    end
  end
end
