FactoryGirl.define do
  factory :film do
    title 'Alien'
    description 'A good film'
    genre1_id '3'
    genre2_id '1'
    rating_id '1'
    image1 'alien.jpg'
    release_year '1979'
    blu_ray_stock '10'
    dvd_stock '5'
    active 'true'
  end
end