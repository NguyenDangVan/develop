FactoryBot.define do
  factory :user do
    sequence(:email){Faker::Internet.email}
    password "123123"
    password_confirmation "123123"

    trait :invalid_email do
      email {Faker::Name.name}
    end
  end
end
