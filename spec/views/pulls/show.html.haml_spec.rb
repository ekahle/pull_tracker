require 'spec_helper'

describe "pulls/show" do
  before(:each) do
    @pull = assign(:pull, stub_model(Pull,
      :name => "Name",
      :status => "Status",
      :description => "MyText",
      :file => "File",
      :investigator => "Investigator",
      :requester => "Requester",
      :pull_list_maker => "Pull List Maker",
      :lab_contact_name => "Lab Contact Name",
      :notes_for_lab => "MyText",
      :has_mta => false,
      :has_budget => false,
      :accepted_consent_to_long_term_storage => false,
      :accepted_emory_specimens => false,
      :accepted_cold_chain_quality => false,
      :accepted_specimen_quality => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
    rendered.should match(/MyText/)
    rendered.should match(/File/)
    rendered.should match(/Investigator/)
    rendered.should match(/Requester/)
    rendered.should match(/Pull List Maker/)
    rendered.should match(/Lab Contact Name/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
