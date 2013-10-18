# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pull do
    status "MyString"
    target_completion_date "2013-06-20"
    description "MyText"
    lab_contact_name "MyString"
    specimen_type "MyString"
    study "MyString"
    participant_type "MyString"
    visit_type "MyString"
    specimen_count 100
    scanned_count 75
    shipped_count 50
    not_found_count 1
    hold false
    repository_notes "MyString"
    lab "MyString"
    mta_number "MyString"
    procedure "MyString"

    factory :pull_with_pull_lists do
      ignore do
        pull_lists_count 2
      end

      after(:create) do |pull, evaluator|
        FactoryGirl.create_list(:pull_list, evaluator.pull_lists_count, pull: pull)
      end
    end

    factory :pull_with_pull_manifests do
      ignore do
        pull_manifests_count 2
      end

      after(:create) do |pull, evaluator|
        FactoryGirl.create_list(:pull_manifest, evaluator.pull_manifests_count, pull: pull)
      end
    end

    factory :pull_with_pull_lists_and_pull_manifests do
      ignore do
        pull_lists_count 2
        pull_manifests_count 2
      end

      after(:create) do |pull, evaluator|
        FactoryGirl.create_list(:pull_list, evaluator.pull_lists_count, pull: pull)
        FactoryGirl.create_list(:pull_manifest, evaluator.pull_manifests_count, pull: pull)
      end
    end
  end
end
