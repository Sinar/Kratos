FactoryGirl.define do
  factory :coalition do
    sequence(:code) { |n| "P#{n}" }
    sequence(:name) { |n| "Pigs #{n}" }
    sequence(:name_in_malay) { |n| "Babi-babi #{n}" }
    founded_in 2012
  end
end
