# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times  do
	Brand.create({
		name: Faker::StarWars.character,
	})
end

10.times do 
	Product.create({
		name: Faker::Lorem.word,
		brand_id: nil,
	})
end

# FactoryBot.define do
# 	factory :todo do
# 	  title { Faker::Lorem.word }
# 	  created_by { Faker::Number.number(10) }
# 	end
# end

# FactoryBot.define do
# 	factory :item do
# 	  name { Faker::StarWars.character }
# 	  done false
# 	  todo_id nil
# 	end
# end

