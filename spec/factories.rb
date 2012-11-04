FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "broomstick"
    password_confirmation "broomstick"
  end

  factory :app do
    name "Angry Birds"
    bundle_id "com.rovio.angry_birds"
  end
end