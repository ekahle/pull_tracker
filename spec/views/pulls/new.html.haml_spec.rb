require 'spec_helper'

describe "pulls/new" do
  before(:each) do
    assign(:pull, stub_model(Pull,
      :name => "MyString",
      :status => "MyString",
      :description => "MyText",
      :file => "MyString",
      :investigator => "MyString",
      :requester => "MyString",
      :pull_list_maker => "MyString",
      :lab_contact_name => "MyString",
      :notes_for_lab => "MyText",
      :has_mta => false,
      :has_budget => false,
      :accepted_consent_to_long_term_storage => false,
      :accepted_emory_specimens => false,
      :accepted_cold_chain_quality => false,
      :accepted_specimen_quality => false
    ).as_new_record)
  end

  it "renders new pull form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pulls_path, "post" do
      assert_select "input#pull_name[name=?]", "pull[name]"
      assert_select "input#pull_status[name=?]", "pull[status]"
      assert_select "textarea#pull_description[name=?]", "pull[description]"
      assert_select "input#pull_file[name=?]", "pull[file]"
      assert_select "input#pull_investigator[name=?]", "pull[investigator]"
      assert_select "input#pull_requester[name=?]", "pull[requester]"
      assert_select "input#pull_pull_list_maker[name=?]", "pull[pull_list_maker]"
      assert_select "input#pull_lab_contact_name[name=?]", "pull[lab_contact_name]"
      assert_select "textarea#pull_notes_for_lab[name=?]", "pull[notes_for_lab]"
      assert_select "input#pull_has_mta[name=?]", "pull[has_mta]"
      assert_select "input#pull_has_budget[name=?]", "pull[has_budget]"
      assert_select "input#pull_accepted_consent_to_long_term_storage[name=?]", "pull[accepted_consent_to_long_term_storage]"
      assert_select "input#pull_accepted_emory_specimens[name=?]", "pull[accepted_emory_specimens]"
      assert_select "input#pull_accepted_cold_chain_quality[name=?]", "pull[accepted_cold_chain_quality]"
      assert_select "input#pull_accepted_specimen_quality[name=?]", "pull[accepted_specimen_quality]"
    end
  end
end
