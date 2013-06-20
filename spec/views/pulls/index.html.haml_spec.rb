require 'spec_helper'

describe "pulls/index" do
  before(:each) do
    assign(:pulls, [FactoryGirl.build(:user), FactoryGirl.build(:user)])
  end

  it "renders a list of pulls" do
    pending
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "Investigator".to_s, :count => 2
    assert_select "tr>td", :text => "Requester".to_s, :count => 2
    assert_select "tr>td", :text => "Pull List Maker".to_s, :count => 2
    assert_select "tr>td", :text => "Lab Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
