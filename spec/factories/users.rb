FactoryBot.define do
  factory :user do
    email { 'default@email.com' }
    password { 'very$secure$password' }
    password_confirmation { 'very$secure$password' }
    name { 'FooFoo' }
    username { 'BarBar' }

    trait :invalid_password do
      password { 12345 }
      password_confirmation { 12345 }
    end
  end
end
