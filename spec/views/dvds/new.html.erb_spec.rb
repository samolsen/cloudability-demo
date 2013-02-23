require 'spec_helper'

describe "dvds/new" do
  before(:each) do
    assign(:dvd, stub_model(Dvd,
      :name => "MyString",
      :summary => "MyText",
      :asin => "MyString"
    ).as_new_record)
    
    @actor    = assign(:actor, stub_model(Actor, {}))
    @director = assign(:director, stub_model(Director, {}))
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
  
  it "renders new actor form" do
    render

    assert_select "form", :action => actors_path, :method => "post" do
      assert_select "input#actor_name", :name => "actor[name]"
      assert_select "input#actor_birth_date", :name => "actor[birth_date]", :class => 'date-picker'
      assert_select "select#actor_gender", :name => "actor[gender]"
      
      assert_select "input[type=submit]", :name => 'commit', :value=> t(:create_and_add)
    end
  end

  
  it "renders new director form" do
    render

    assert_select "form", :action => directors_path, :method => "post" do
      assert_select "input#director_name", :name => "director[name]"
      assert_select "input#director_birth_date", :name => "director[birth_date]", :class => 'date-picker'
      assert_select "select#director_gender", :name => "director[gender]"
      
    end
  end
  
end
