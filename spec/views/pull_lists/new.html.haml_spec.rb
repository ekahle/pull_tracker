require 'spec_helper'

describe "pull_lists/new" do
  before(:each) do
    assign(:pull_list, stub_model(PullList,
      :file => "MyString"
    ).as_new_record)
  end

  it "renders new pull_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pull_lists_path, "post" do
      assert_select "input#pull_list_file[name=?]", "pull_list[file]"
    end
  end
end
