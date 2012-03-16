FactoryGirl.define do

  factory :member do

    sequence(:name) { |n| "Nicole Neal (#{n})" }

    factory :member_with_party do

      after_create do |member|
        party = FactoryGirl.create(:party)
        FactoryGirl.create(:party_membership, { party: party, member: member, joined_at: 1.year.ago.year })
      end

    end

  end

end
