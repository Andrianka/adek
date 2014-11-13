# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


11.times do |i|
  User.create(email:"email_#{i}@example.com", password:"abc12345", password_confirmation:"abc12345")
end

11.times do |i|
  Product.create(name:"product_#{i}", price:10.99)
end