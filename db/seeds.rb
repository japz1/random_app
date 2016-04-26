# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

users_seed = [
  ["olga", "olga@iatm.com.co", "olga2016", "nurse"],
  ["ruth", "ruth@iatm.com.co", "ruth2016", "nurse"],
  ["luz", "luz@iatm.com.co", "luzdavid2016", "nurse"],
  ["jorge", "jorge@iatm.com.co", "jorge2016", "nurse"],
  ["luisa", "luisa@iatm.com.co", "luisa2016", "nurse"],
  ["lessa", "lessa@iatm.com.co", "lessa2016", "nurse"],
  ["lilian", "lilian@iatm.com.co", "lilian2016", "nurse"],
  ["leidy", "leidy@iatm.com.co", "leidy2016", "nurse"],
  ["diego", "diego@iatm.com.co", "diego2016", "nurse"],
  ["gabriel", "gabriel@iatm.com.co", "gabriel2016", "admin"],
  ["radiologo", "radiologo@iatm.com.co", "radiologo2016", "radiologist"], 
  ["admin", "admin@iatm.com.co", "admin2016!", "admin"]
] 

users_seed.each do |var|
  user = User.create! name: var[0], email: var[1], password: var[2], role: var[3]
  puts 'user: ' << user.name
end
