FactoryGirl.define do
  factory :film do
    title 'Alien'
    image1 'alien.jpg'
    description 'A good film'
    genre1_id '3'
    genre2_id '1'
    rating_id '1'
    release_year '1979'
    blu_ray_stock '10'
    dvd_stock '5'
    active 'true'

    after :create do |b|
      b.update_column(:image1, "alien.jpg")
    end
  end
end