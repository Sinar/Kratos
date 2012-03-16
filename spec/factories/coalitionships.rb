FactoryGirl.define do
  factory :coalitionship do
    association :coalition
    association :party
  end
end
