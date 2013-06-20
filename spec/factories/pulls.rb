# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pull do
    name "MyString"
    status "MyString"
    target_completion_date "2013-06-20"
    description "MyText"
    file "MyString"
    investigator "MyString"
    requester "MyString"
    pull_list_maker "MyString"
    lab_contact_name "MyString"
    notes_for_lab "MyText"
    has_mta false
    has_budget false
    accepted_consent_to_long_term_storage false
    accepted_emory_specimens false
    accepted_cold_chain_quality false
    accepted_specimen_quality false
  end
end
