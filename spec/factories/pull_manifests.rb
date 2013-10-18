# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pull_manifest do
    file "MyString"
    pull
  end
end
