require 'spec_helper'

describe "pull_manifests/new" do
  before(:each) do
    assign(:pull_manifest, stub_model(PullManifest,
      :file => "MyString"
    ).as_new_record)
  end

  it "renders new pull_manifest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pull_manifests_path, "post" do
      assert_select "input#pull_manifest_file[name=?]", "pull_manifest[file]"
    end
  end
end
