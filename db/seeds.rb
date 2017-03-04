# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Genre.exists?
  Genre.create(genre: 'Horror')
  Genre.create(genre: 'Comedy')
  Genre.create(genre: 'Action')
  Genre.create(genre: 'Western')
end

unless Rating.exists?
  Rating.create(rating: '18')
  Rating.create(rating: '15')
  Rating.create(rating: '12')
  Rating.create(rating: 'PG')
  Rating.create(rating: 'U')
end