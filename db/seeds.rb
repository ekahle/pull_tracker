
## Default user
User.find_or_create_by_email(FactoryGirl.attributes_for(:user, email: 'JohnDoe@example.com'))

## Just some play data
3.times do
  User.find_or_create_by_email(FactoryGirl.attributes_for(:user))
  Pull.find_or_create_by_name(FactoryGirl.attributes_for(:pull))
end
