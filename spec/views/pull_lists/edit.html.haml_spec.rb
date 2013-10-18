require 'spec_helper'

describe "pull_lists/edit" do
  before(:each) do
    @pull_list = assign(:pull_list, stub_model(PullList,
      :file => "MyString"
    ))
  end

  it "renders the edit pull_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pull_list_path(@pull_list), "post" do
      assert_select "input#pull_list_file[name=?]", "pull_list[file]"
    end
  end
end
