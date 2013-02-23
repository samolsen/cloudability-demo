require 'spec_helper'

describe "actors/new" do
  before(:each) do
    assign(:actor, stub_model(Actor,
      :name => "MyString",
      :gender => "male"
    ).as_new_record)
  end

  it "renders new actor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actors_path, :method => "post" do
      assert_select "input#actor_name", :name => "actor[name]"
      assert_select "input#actor_birth_date", :name => "actor[birth_date]", :class => 'date-picker'
      assert_select "select#actor_gender", :name => "actor[gender]"
      
      assert_select "input[type=submit]", :name => 'commit', :value=> t(:create_and_add)
    end
  end
  
end
