require 'spec_helper'

describe "pull_lists/show" do
  before(:each) do
    @pull_list = assign(:pull_list, stub_model(PullList,
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
