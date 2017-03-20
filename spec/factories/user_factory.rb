FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#[n}@example.com" }
    password "password"
    address_id '1'

    trait :admin do
      admin true
    end
  end
end