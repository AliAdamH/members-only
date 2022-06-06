FactoryBot.define do
  factory :post do
    title { 'A Sensible Title' }
    body { 'An Interesting Choice of Words' }
    user { create(:user) }

    trait :blank_invalid do
      title { nil }
      body { nil }
    end

    trait :title_length_invalid do
      title { 'A VERY LONG TITLE WITH MORE THAN THIRTY CHARACTERS' }
    end

    trait :body_length_invalid do
      body {
        'a' * 257
      }
    end
  end
end
