# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'JohnDoe@example.com',
  password: 'password',
  password_confirmation: 'password'
)
