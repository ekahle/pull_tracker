require 'spec_helper'

describe "pull_manifests/index" do
  before(:each) do
    assign(:pull_manifests, [
      stub_model(PullManifest,
        :file => "File"
      ),
      stub_model(PullManifest,
        :file => "File"
      )
    ])
  end

  it "renders a list of pull_manifests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
