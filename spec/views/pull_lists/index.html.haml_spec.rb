require 'spec_helper'

describe "pull_lists/index" do
  before(:each) do
    assign(:pull_lists, [
      stub_model(PullList,
        :file => "File"
      ),
      stub_model(PullList,
        :file => "File"
      )
    ])
  end

  it "renders a list of pull_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
