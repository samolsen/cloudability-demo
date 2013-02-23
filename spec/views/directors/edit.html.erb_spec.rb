require 'spec_helper'

describe "directors/edit" do
  before(:each) do
    @director = assign(:director, stub_model(Director,
      :name => "MyString",
      :gender => "MyString"
    ))
  end

  it "renders the edit director form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => directors_path(@director), :method => "post" do
      assert_select "input#director_name", :name => "director[name]"
      assert_select "select#director_gender", :name => "director[gender]"
      
      assert_select "select#director_dvd_ids", :name => "director[dvd_ids]", :'data-placeholder' => t("data_placeholders.choose_dvds")
    end
  end
end
