require 'spec_helper'

describe "pull_manifests/edit" do
  before(:each) do
    @pull_manifest = assign(:pull_manifest, stub_model(PullManifest,
      :file => "MyString"
    ))
  end

  it "renders the edit pull_manifest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pull_manifest_path(@pull_manifest), "post" do
      assert_select "input#pull_manifest_file[name=?]", "pull_manifest[file]"
    end
  end
end
