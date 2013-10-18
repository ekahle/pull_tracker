require 'spec_helper'

describe "pull_manifests/show" do
  before(:each) do
    @pull_manifest = assign(:pull_manifest, stub_model(PullManifest,
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
