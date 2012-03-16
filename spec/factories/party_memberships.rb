FactoryGirl.define do
  factory :party_membership do
    association :party
    association :member
  end
end
