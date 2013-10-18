
## Default user
User.find_or_create_by_email(FactoryGirl.attributes_for(:user, email: 'JohnDoe@example.com'))

## Just some play data
3.times do
  User.find_or_create_by_email(FactoryGirl.attributes_for(:user))
  FactoryGirl.create(:pull)
  FactoryGirl.create(:pull_with_pull_lists)
  FactoryGirl.create(:pull_with_pull_manifests)
  FactoryGirl.create(:pull_with_pull_lists_and_pull_manifests)
end
