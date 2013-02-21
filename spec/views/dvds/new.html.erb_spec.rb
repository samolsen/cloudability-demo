require 'spec_helper'

describe "dvds/new" do
  before(:each) do
    assign(:dvd, stub_model(Dvd,
      :name => "MyString",
      :summary => "MyText",
      :asin => "MyString"
    ).as_new_record)
  end

  it "renders new dvd form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dvds_path, :method => "post" do
      assert_select "input#dvd_name", :name => "dvd[name]"
      assert_select "textarea#dvd_summary", :name => "dvd[summary]"
      assert_select "input#dvd_asin", :name => "dvd[asin]"
    end
  end
end
