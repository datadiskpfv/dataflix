# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Genre.exists?
  Genre.create(genre: 'Horror', id: 1)
  Genre.create(genre: 'Comedy', id:3)
  Genre.create(genre: 'Action', id: 6)
  Genre.create(genre: 'Western', id: 8)
  Genre.create(genre: 'Thriller', id: 7)
  Genre.create(genre: 'ScFi', id: 2)
  Genre.create(genre: 'Romantic', id: 5)
  Genre.create(genre: 'War', id: 9)
end

unless Rating.exists?
  Rating.create(rating: '18', id: 1)
  Rating.create(rating: '15', id: 5)
  Rating.create(rating: '12', id: 8)
  Rating.create(rating: 'PG', id: 7)
  Rating.create(rating: 'U', id: 6)
end